// Delete content record.
query "content/{content_id}" verb=DELETE {
  api_group = "first test"

  input {
    int content_id? filters=min:1
  }

  stack {
    db.del content {
      field_name = "id"
      field_value = $input.content_id
    }
  }

  response = null
}