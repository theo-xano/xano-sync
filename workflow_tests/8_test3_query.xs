workflow_test "test3-query" {
  stack {
    db.add "⚙️Settings" {
      data = {id: 1, name: "test"}
    }
  
    db.query "⚙️Settings" {
      return = {type: "list"}
    } as $recordOne
  
    expect.to_equal ($recordOne) {
      value = `FAIL`
    }
  }
}