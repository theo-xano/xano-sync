// Update 🅵Emoji record
query "_emoji/{_emoji_id}" verb=PUT {
  api_group = "first test"

  input {
    int _emoji_id? filters=min:1
    dblink {
      table = "🅵Emoji"
    }
  }

  stack {
    db.edit "🅵Emoji" {
      field_name = "id"
      field_value = $input._emoji_id
      data = {}
    } as $model
  }

  response = $model
}