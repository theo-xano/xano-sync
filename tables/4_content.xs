table content {
  auth = false

  schema {
    int id
    timestamp created_at?=now
    text content? filters=trim
    vector? embeddings? {
      size = 3
    }
  
    email email? filters=trim
    int projects_id? {
      table = "projects"
    }
  
    int trigger_log_id? {
      table = "trigger_log"
    }
  }

  index = [
    {type: "primary", field: [{name: "id"}]}
    {type: "btree", field: [{name: "created_at", op: "desc"}]}
  ]
}