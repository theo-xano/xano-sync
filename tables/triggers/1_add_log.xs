table_trigger add_log {
  table = "dummy_data"

  input {
    json new
    json old
    enum action {
      values = ["insert", "update", "delete", "truncate"]
    }
  
    text datasource
  }

  stack {
    db.add trigger_log {
      data = {created_at: "now"}
    } as $trigger_log1
  }

  actions = {insert: true}
  datasources = ["live"]
}