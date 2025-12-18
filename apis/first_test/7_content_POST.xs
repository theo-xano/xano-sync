// Add content record
query content verb=POST {
  api_group = "first test"

  input {
    dblink {
      table = "content"
    }
  }

  stack {
    db.add content {
      data = {
        created_at: "now"
        content   : $input.content
        embeddings: $input.embeddings
      }
    } as $content
  }

  response = $content
}