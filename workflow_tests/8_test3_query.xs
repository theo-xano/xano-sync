workflow_test "test3-query" {
  stack {
    db.add "⚙️Settings" {
      data = {id: 1, name: "test"}
    } as $recordOne
  
    expect.to_equal ($recordOne) {
      value = {id: 1, name: "test"}
    }
  }
}