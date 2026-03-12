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
  }

  actions = {insert: true}
}