// Update ⚙️Settings record
query "_settings/{_settings_id}" verb=PUT {
  api_group = "first test"

  input {
    int _settings_id? filters=min:1
    dblink {
      table = "⚙️Settings"
    }
  }

  stack {
    db.edit "⚙️Settings" {
      field_name = "id"
      field_value = $input._settings_id
      data = {name: $input.name}
    } as $model
  }

  response = $model
}