// Edit customers record
query "customers/{customers_id}" verb=PATCH {
  api_group = "first test"

  input {
    int customers_id? filters=min:1
    dblink {
      table = "customers"
    }
  }

  stack {
    util.get_raw_input {
      encoding = "json"
      exclude_middleware = false
    } as $raw_input
  
    db.patch customers {
      field_name = "id"
      field_value = $input.customers_id
      data = `$input|pick:($raw_input|keys)`|filter_null|filter_empty_text
    } as $model
  }

  response = $model
}