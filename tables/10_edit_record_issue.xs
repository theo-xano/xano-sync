table edit_record_issue {
  auth = false

  schema {
    int id
    timestamp created_at?=now
    text name? filters=trim
    object location? {
      schema {
        text city? filters=trim
      }
    }
  
    json metadata?
    bool active?
  }

  index = [
    {type: "primary", field: [{name: "id"}]}
    {type: "btree", field: [{name: "created_at", op: "desc"}]}
  ]
}