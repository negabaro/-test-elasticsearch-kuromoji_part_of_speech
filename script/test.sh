curl -H "Content-Type: application/json" -XPUT "http://localhost:9200/kuromoji_index?pretty" -d '
{
  "settings": {
    "analysis": {
      "analyzer": {
        "my_kuromoji_analyzer": {
          "type": "custom",
          "tokenizer": "kuromoji_tokenizer"
        }
      }
    }
  },
  "mappings": {
    "properties": {
      "sample_text": {
        "type": "text",
        "analyzer": "my_kuromoji_analyzer",
        "fielddata": true,
        "fields": {
          "keyword": {
            "type": "keyword"
          }
        }
      }
    }
  }
}
'