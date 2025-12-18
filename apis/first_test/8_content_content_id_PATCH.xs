// Edit content record
query "content/{content_id}" verb=PATCH {
  api_group = "first test"

  input {
    int content_id? filters=min:1
    dblink {
      table = "content"
    }
  }

  stack {
    util.get_raw_input {
      encoding = "json"
      exclude_middleware = false
    } as $raw_input
  
    db.patch content {
      field_name = "id"
      field_value = $input.content_id
      data = `$input|pick:($raw_input|keys)`|filter_null|filter_empty_text
    } as $content
  }

  response = $content
}