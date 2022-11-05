IMG_NAME="elasticsearch-kuromoji_part_of_speech"

APP_CONTAINER_ID=`docker ps | grep ${IMG_NAME} | awk '{print $$1}'`

ENV_MODE="test"
SERVICE="es"
CONTAINER_NAME=${ENV_MODE}-${SERVICE}

AWS_PROFILE="default"

define DOCKER_RUN
docker run 	--rm --name $(CONTAINER_NAME) -v $$PWD/script:/script -p 9200:9200 $(IMG_NAME)/$(CONTAINER_NAME)
endef
export DOCKER_RUN

define DOCKER_BUILD
docker build -t ${IMG_NAME}/${CONTAINER_NAME} --file Dockerfile .
endef

define DOCKER_PUSH
#docker commit ${RAILS_CONTAINER_ID} ${IMG_NAME}/${CONTAINER_NAME}
docker tag ${IMG_NAME}/${CONTAINER_NAME} ${ECR_HOST}/${STG_PRD_ECR_IMG_NAME}:${ECR_IMG_TAG}
docker push ${ECR_HOST}/${STG_PRD_ECR_IMG_NAME}:${ECR_IMG_TAG}
endef

define DOCKER_RM_IF_CONTAINER_IS_ALIVE
if [ `docker ps -q -f name=${CONTAINER_NAME}` ]; then docker rm -f ${CONTAINER_NAME}; fi
endef

ecr-login:
	aws ecr get-login --no-include-email --region ap-northeast-1 --profile ${AWS_PROFILE} | sh -

push: ecr-login
	$(DOCKER_BUILD)
	$(DOCKER_PUSH)

# rails dockerイメージをbuildする
build:
	$(DOCKER_RM_IF_CONTAINER_IS_ALIVE)
	$(DOCKER_BUILD)

run:
	$(DOCKER_RM_IF_CONTAINER_IS_ALIVE)
	$(DOCKER_RUN)

# rails dockerイメージをbuild & runする
build-run:
	$(DOCKER_RM_IF_CONTAINER_IS_ALIVE)
	$(DOCKER_BUILD)
	$(DOCKER_RUN)

check:
	docker exec -it $(APP_CONTAINER_ID) sh /script/check.sh

create-script:
	docker exec -it $(APP_CONTAINER_ID) sh /script/part_of_speech-test.sh

get-script:
	docker exec -it $(APP_CONTAINER_ID) sh /script/part_of_speech-test2.sh

app-log:
	docker logs $(APP_CONTAINER_ID) -f

# railsコンテナーに接続
bash:
	docker exec -it $(APP_CONTAINER_ID) bash

