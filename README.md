

## How to run

### 1. docker build and run

```
make build-run
```

### 2. check 

```
make check
```

Make sure there are no `localhost port 9200: Connection refused`


### 3. create command 

```
make create-script
```

```
{
  "acknowledged" : true,
  "shards_acknowledged" : true,
  "index" : "part_of_speech-test"
}
```


### 4. get command

```
make get-script
```

```
{"tokens":[{"token":"寿司","start_offset":0,"end_offset":2,"type":"word","position":0},{"token":"おいしい","start_offset":3,"end_offset":7,"type":"word","position":2}]}
```




## dockerfile

https://qiita.com/jrfk/items/a8d63cb1130304616bc0

## search example

https://qiita.com/tsgkdt/items/8f6f172b1f53bd608e0a
## plugin



https://www.kazuy.net/posts/install_kuromoji_in_elasticsearch

https://www.elastic.co/guide/en/elasticsearch/plugins/current/analysis-kuromoji-speech.html#analysis-kuromoji-speech

https://techblog.zozo.com/entry/elasticsearch-mapping-config-for-japanese-search