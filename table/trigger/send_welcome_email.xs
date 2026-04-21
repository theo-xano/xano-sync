table_trigger "send welcome email" {
  table = "customers"

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