addon outcome {
  input {
  }

  stack {
    db.query "⚙️Settings" {
      return = {type: "list"}
    }
  }
}