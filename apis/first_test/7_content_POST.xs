// Add content record
query content verb=POST {
  api_group = "first test"

  input {
    dblink {
      table = "content"
    }
  }

  stack {
    !db.add content {
      data = {
        created_at: "now"
        content   : $input.content
        embeddings: $input.embeddings
      }
    } as $content
  
    !db.edit content {
      field_name = "id"
      field_value = 2
      data = {content: $input.content, embeddings: $input.embeddings}
    } as $content1
  
    !db.get content {
      field_name = "id"
      field_value = 2
    } as $content1
  
    var $x1 {
      value = $env.$request_uri
    }
  }

  response = $x1
}