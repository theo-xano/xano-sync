// Add realtime_logs record
query realtime_logs verb=POST {
  api_group = "first test"

  input {
    dblink {
      table = "realtime_logs"
    }
  }

  stack {
    db.add realtime_logs {
      data = {
        created_at      : "now"
        one_with_uuid_id: $input.one_with_uuid_id
      }
    } as $model
  }

  response = $model
}