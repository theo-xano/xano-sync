// Edit table_name with a space record
query "table_name_with_a_space/{table_name_with_a_space_id}" verb=PATCH {
  api_group = "first test"

  input {
    int table_name_with_a_space_id? filters=min:1
    dblink {
      table = "table_name with a space"
    }
  }

  stack {
    util.get_raw_input {
      encoding = "json"
      exclude_middleware = false
    } as $raw_input
  
    db.patch "table_name with a space" {
      field_name = "id"
      field_value = $input.table_name_with_a_space_id
      data = `$input|pick:($raw_input|keys)`|filter_null|filter_empty_text
    } as $model
  }

  response = $model
}