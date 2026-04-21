function "xs test" {
  input {
    text testInput? filters=trim
  }

  stack {
    !var $x1 {
      value = []
    }
  
    !for (2) {
      each {
        debug.log {
          value = "Yo yO!"
        }
      
        array.unshift $x1 {
          value = 0
        }
      }
    }
  
    action.call "" {
      input = {
        input_text: "dsdsds"
        model     : "text-embedding-3-large"
      }
    
      registry = {openai_api_key: "jknkjbnkbkbj"}
    } as $action1
  }

  response = $x1
}