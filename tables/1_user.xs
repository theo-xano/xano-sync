table user {
  auth = true

  schema {
    int id
    timestamp created_at?=now {
      visibility = "private"
    }
  
    text name filters=trim
    email? email filters=trim|lower
    password? password filters=min:8|minAlpha:1|minDigit:1 {
      visibility = "internal"
    }
  
    // Magic link object with token and expiration
    object? magic_link? {
      schema {
        text token? filters=trim
      
        // Time the token expires
        timestamp expiration?
      
        bool used?
      }
    }
  }

  index = [
    {type: "primary", field: [{name: "id"}]}
    {type: "btree", field: [{name: "created_at", op: "desc"}]}
    {type: "btree|unique", field: [{name: "email", op: "asc"}]}
    {type: "gin", field: [{name: "xdo", op: "jsonb_path_op"}]}
  ]
}