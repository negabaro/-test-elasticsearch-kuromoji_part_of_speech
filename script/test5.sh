curl -H "Content-Type: application/json" -XPOST "http://localhost:9200/qiita/_analyze" -d '
{
  "analyzer": "ja-normal-analyzer",
  "text" : "関西国際空港"
}
'