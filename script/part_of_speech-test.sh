curl -H "Content-Type: application/json" -XPUT "http://localhost:9200/part_of_speech-test?pretty" -d '
{
  "settings": {
    "index": {
      "analysis": {
        "analyzer": {
          "my_analyzer": {
            "tokenizer": "kuromoji_tokenizer",
            "filter": [
              "my_posfilter"
            ]
          }
        },
        "filter": {
          "my_posfilter": {
            "type": "kuromoji_part_of_speech",
            "stoptags": [
              "助詞-格助詞-一般",
              "助詞-終助詞"
            ]
          }
        }
      }
    }
  }
}
'