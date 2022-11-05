curl -H "Content-Type: application/json" -XPOST "http://localhost:9200/basic-test/_analyze" -d '
{
  "analyzer": "ja-search-analyzer",
  "text" : "寿司がおいしいね"
}
'
