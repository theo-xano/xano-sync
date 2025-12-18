// Edit dummy_data record
query "dummy_data/{dummy_data_id}" verb=PATCH {
  api_group = "first test"

  input {
    int dummy_data_id? filters=min:1
    dblink {
      table = "dummy_data"
    }
  }

  stack {
    util.get_raw_input {
      encoding = "json"
      exclude_middleware = false
    } as $raw_input
  
    db.patch dummy_data {
      field_name = "id"
      field_value = $input.dummy_data_id
      data = `$input|pick:($raw_input|keys)`|filter_null|filter_empty_text
    } as $model
  }

  response = $model
}