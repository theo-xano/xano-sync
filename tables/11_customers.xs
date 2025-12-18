table customers {
  auth = false

  schema {
    int id
    timestamp created_at?=now
    text Name? filters=trim|pattern:"/^[\\p{L}\\p{Nd}\\s'.,_()@#\\/+\\-]{0,30}$/u":"Invalid name"
    int Pincode?
  
    // Customer's physical address
    text address? filters=trim
  }

  index = [
    {type: "primary", field: [{name: "id"}]}
    {type: "btree", field: [{name: "created_at", op: "desc"}]}
  ]
}