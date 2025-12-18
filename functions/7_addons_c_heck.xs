function addonsCHeck {
  input {
  }

  stack {
    !db.query content {
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
  
    db.edit edit_record_issue {
      field_name = "id"
      field_value = 1
      data = {location: {city: ""}}
    } as $edit_record_issue1
  
    !array.group_by ($content1) {
      by = $this
    } as $x2
  
    !array.group_by ($x2) {
      by = $this
    } as $x3
  
    !array.group_by ($x3) {
      by = $this
    } as $x4
  
    !precondition ($x2.someKey != "" || $x3.someKey != "") {
      error = "You are missing a value for one or more applicant's first name or last name. Please include a first name, last name, or both."
    }
  
    !precondition ($x2.someKey != "" || $x3.someKey != "") {
      error = "You are missing a value forone or more applicant's first name or last name. Please include a ssssfirst name, last name, or both."
    }
  
    !var $out {
      value = []
    }
  
    !db.query user {
      where = $db.user.id > 0
      return = {type: "list"}
    } as $users
  
    // <- editor flags "as" as an error
    !util.send_email {
      service_provider = "xano"
      subject = "Welcome"
      message = "Thanks for signing up, "
        |concat:($input.new.name|split:" "|first):""
    } as $email_sent
  
    !db.query customers {
      return = {type: "list"}
      addon = [
        {
          name : "trigger_log"
          input: {trigger_log_id: ""}
          as   : "_trigger_log"
        }
      ]
    } as $customers1
  
    !db.query trigger_log {
      return = {type: "list"}
      addon = [{name: "outcome", as: "outcome_id"}]
    } as $trigger_log1
  
    group {
      stack {
        db.direct_query {
          sql = """
            SELECT
              c.id AS content_id,
              c.created_at AS content_created_at,
              c.content,
              c.email AS content_email
            FROM
              x1_4 AS c
            """
          parser = "template_engine"
          response_type = "list"
        } as $x1
      
        api.realtime_event {
          channel = ""
          data = ""
          auth_table = ""
          auth_id = ""
        }
      }
    }
  }

  response = $x1
}