// Get 🅵Emoji record
query "_emoji/{_emoji_id}" verb=GET {
  api_group = "first test"
  auth = "user"

  input {
    int _emoji_id? filters=min:1
  }

  stack {
    db.get "🅵Emoji" {
      field_name = "id"
      field_value = $input._emoji_id
    } as $model
  
    precondition ($model != null) {
      error_type = "notfound"
      error = "Not Found"
    }
  }

  response = $model
  middleware = {pre: [{name: "test 1"}]}
}