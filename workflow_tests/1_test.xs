workflow_test test {
  stack {
    expect.to_throw {
      stack {
        function.run addonsCHeck as $func1
        debug.log {
          value = "whoa! not visible in XS?"
        }
      
        debug.log {
          value = "whoa! not visible in XS?"
        }
      }
    
      exception = "Some exception here"
    }
  }
}