addon trigger_log {
  input {
    int trigger_log_id? {
      table = "trigger_log"
    }
  }

  stack {
    db.query trigger_log {
      where = $db.trigger_log.id == $input.trigger_log_id
      return = {type: "exists"}
    }
  }
}