table_trigger generate_embeddings {
  table = "content"

  input {
    json new
    json old
    enum action {
      values = ["insert", "update", "delete", "truncate"]
    }
  
    text datasource
  }

  stack {
    api.request {
      url = ""
      method = "GET"
      params = {}|set:"content":"new.content"
    } as $api1
  }

  actions = {}
}