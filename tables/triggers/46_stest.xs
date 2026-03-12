table_trigger stest {
  table = "realtime_logs"

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
      url = "https://webhook.site/c21b54a2-89ea-459a-a5dd-ac24c99fe071"
      method = "GET"
    } as $api1
  }

  actions = {insert: true}
}