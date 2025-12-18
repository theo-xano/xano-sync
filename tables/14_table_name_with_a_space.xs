table "table_name with a space" {
  auth = false

  schema {
    int id
    timestamp created_at?=now
    json testjson?
  }

  index = [
    {type: "primary", field: [{name: "id"}]}
    {type: "btree", field: [{name: "created_at", op: "desc"}]}
  ]
}