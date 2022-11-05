curl -H "Content-Type: application/json" -XPOST "http://localhost:9200/part_of_speech-test/_analyze" -d '
{
  "analyzer": "my_analyzer",
  "text" : "寿司がおいしいね"
}
'
