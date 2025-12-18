realtime_trigger logIt {
  channel = "72958391331548|test"

  input {
    enum action {
      values = ["message", "join"]
    }
  
    text channel
    object client {
      schema {
        json extras
        object permissions {
          schema {
            int dbo_id
            text row_id
          }
        }
      }
    }
  
    object options {
      schema {
        bool authenticated
        text channel
      }
    }
  
    json payload
  }

  stack {
    db.add realtime_logs {
      data = {created_at: "now"}
    } as $realtime_logs1
  }

  response = "Hi Realtime User"
  actions = {message: true, join: true}
}