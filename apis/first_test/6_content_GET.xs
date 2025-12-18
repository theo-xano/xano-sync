// Query all content records
query content verb=GET {
  api_group = "first test"

  input {
  }

  stack {
    db.query content {
      return = {type: "list"}
    } as $content
  
    function.run queryCheck as $func1
  }

  response = $content
  middleware = {pre: [{name: "test 1"}, {name: "test 2"}]}
}