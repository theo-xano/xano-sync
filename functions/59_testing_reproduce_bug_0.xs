function "testing/reproduce_bug_0" {
  input {
    text message? filters=trim
  }

  stack {
    var $payload {
      value = {}
        |set:"role":(1 > 2 ? "buyer"):"seller"
    }
  }

  response = $payload
}