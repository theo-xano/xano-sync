table "table_name with a space" {
  auth = false

  schema {
    int id
    timestamp created_at?=now
    json testjson?
    decimal jygj?
    text Capital? filters=trim
    text capital? filters=trim
  }

  index = [
    {type: "primary", field: [{name: "id"}]}
    {type: "btree", field: [{name: "created_at", op: "desc"}]}
  ]
}