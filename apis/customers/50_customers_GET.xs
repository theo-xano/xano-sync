// Query all customers records
query customers verb=GET {
  api_group = "Customers"

  input {
  }

  stack {
    db.query customers {
      return = {type: "list"}
    } as $customers
  
    var $x1 {
      value = {
       "hello" : "hi",
       "another": "test",
       "of": "xanoscript",
       "long": "version",
      }| get:"of"| set:"type":"try"
    }
  }

  response = $customers
}