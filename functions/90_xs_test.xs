function "xs test" {
  input {
    text testInput? filters=trim
  }

  stack {
    var $x1 {
      value = []
    }
  
    for (2) {
      each {
        debug.log {
          value = "Yo yO!"
        }
      
        array.unshift $x1 {
          value = 0
        }
      }
    }
  }

  response = $x1
}