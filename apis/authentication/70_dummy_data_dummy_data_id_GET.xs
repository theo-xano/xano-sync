// Get dummy_data record
query "dummy_data/{dummy_data_id}" verb=GET {
  api_group = "Authentication"

  input {
    int dummy_data_id? filters=min:1
  }

  stack {
    db.get dummy_data {
      field_name = "id"
      field_value = $input.dummy_data_id
    } as $model
  
    precondition ($model != null) {
      error_type = "notfound"
      error = "Not Found"
    }
  }

  response = $model
}