// Get content record
query "content/{content_id}" verb=GET {
  api_group = "first test"

  input {
    int content_id? filters=min:1
  }

  stack {
    db.get content {
      field_name = "id"
      field_value = $input.content_id
    } as $content
  
    precondition ($content != null) {
      error_type = "notfound"
      error = "Not Found."
    }
  }

  response = $content
}