table projects {
  auth = false

  schema {
    int id
    timestamp created_at?=now
    text name? filters=trim
    text description? filters=trim
    int duration_in_weekss?
  }

  index = [
    {type: "primary", field: [{name: "id"}]}
    {type: "btree", field: [{name: "created_at", op: "desc"}]}
  ]
}