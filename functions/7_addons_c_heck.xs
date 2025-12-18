function addonsCHeck {
  input {
  }

  stack {
    db.query content {
      return = {type: "list"}
      addon = [
        {
          name : "dummy_data"
          input: {dummy_data_id: ""}
          as   : "_dummy_data"
        }
        {
          name : "trigger_log"
          input: {trigger_log_id: ""}
          as   : "_trigger_log"
        }
      ]
    } as $content1
  }

  response = $content1
}