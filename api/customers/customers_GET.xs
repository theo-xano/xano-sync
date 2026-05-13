// Query all customers records
query customers verb=GET {
  api_group = "Customers"
  auth = "user"

  input {
  }

  stack {
    !db.query content {
      where = $db.content.id == 2
      return = {type: "list"}
    } as $content1
  
    !db.query content {
      where = $db.content.id == 1
      return = {type: "list"}
    } as $content2
  
    db.query content {
      where = $db.content.id == 3
      return = {type: "list"}
    } as $content3
  
    function.run check_missing_records {
      runtime_mode = "async-shared"
    } as $func1
  }

  response = $content3
}