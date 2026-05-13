// Query all customers records
query customers verb=GET {
  api_group = "Customers"

  input {
  }

  stack {
    db.query content {
      where = $db.content.id == 3
      return = {type: "list"}
    } as $content3
  
    function.run check_missing_records as $func1
  }

  response = $content3
}