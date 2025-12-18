// Add 🅵Emoji record
query _emoji verb=POST {
  api_group = "first test"

  input {
    dblink {
      table = "🅵Emoji"
    }
  }

  stack {
    db.add "🅵Emoji" {
      data = {created_at: "now"}
    } as $model
  }

  response = $model
}