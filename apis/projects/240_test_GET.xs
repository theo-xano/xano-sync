query test verb=GET {
  api_group = "projects"

  input {
  }

  stack {
    !var $x1 {
      value = $env.$http_headers
        |entries
        |map:'return $this.key + ": " + $this.value':10
        |count
    }
  
    !object.entries {
      value = $env.$http_headers
    } as $x2|flatten
  
    !var $x2 {
      value = $env.$http_headers
    }
  
    db.add "⚙️Settings" {
      data = {name: "wow"}
    } as $_Settings1
  }

  response = $_Settings1
}