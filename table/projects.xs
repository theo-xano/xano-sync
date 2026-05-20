table projects {
  auth = false

  schema {
    int id
    timestamp created_at?=now {
      visibility = "private"
    }
  
    text name? filters=trim
    text description? filters=trim
    int duration_in_weekss?
    object[] object_list? {
      schema {
        text id? filters=trim
        text name? filters=trim
      }
    }
  
    json[] jsonList?
  }

  index = [
    {type: "primary", field: [{name: "id"}]}
    {type: "btree", field: [{name: "created_at", op: "desc"}]}
  ]
}