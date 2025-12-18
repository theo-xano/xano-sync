table trigger_log {
  auth = false

  schema {
    int id
    timestamp created_at?=now
    object[] someList? {
      schema {
        text id? filters=trim
        text description? filters=trim
      }
    }
  }

  index = [
    {type: "primary", field: [{name: "id"}]}
    {type: "btree", field: [{name: "created_at", op: "desc"}]}
  ]
}