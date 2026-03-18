workflow_test "test3-query" {
  stack {
    db.add "⚙️Settings" {
      data = {name: "testtt"}
    }
  
    db.query "⚙️Settings" {
      return = {type: "list"}
    } as $recordOne
  
    expect.to_equal ($recordOne) {
      value = `FAIL`
    }
  }
}