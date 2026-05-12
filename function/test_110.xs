function test_110 {
  input {
  }

  stack {
    db.query content {
      return = {type: "list"}
    } as $content1
  }

  response = $func1
}