curl -H "Content-Type: application/json" -XPUT "http://localhost:9200/basic-test?pretty" -d '
{
  "settings": {
    "analysis": {
      "analyzer": {
        "ja-normal-analyzer": {
          "type": "custom",
          "tokenizer": "ja-normal-tokenizer"
        },
        "ja-search-analyzer": {
          "type": "custom",
          "tokenizer": "ja-search-tokenizer"
        },
        "ja-extended-analyzer": {
          "type": "custom",
          "tokenizer": "ja-extended-tokenizer"
        }
      },
      "tokenizer": {
        "ja-normal-tokenizer": {
          "type": "kuromoji_tokenizer",
          "mode": "normal"
        },
        "ja-search-tokenizer": {
          "type": "kuromoji_tokenizer",
          "mode": "search"
        },
        "ja-extended-tokenizer": {
          "type": "kuromoji_tokenizer",
          "mode": "extended"
        },
      }
    }
  }
}
'