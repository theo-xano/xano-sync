// Edit edit_record_issue record
query "edit_record_issue/{edit_record_issue_id}" verb=PATCH {
  api_group = "first test"

  input {
    int edit_record_issue_id? filters=min:1
    dblink {
      table = "edit_record_issue"
    }
  }

  stack {
    util.get_raw_input {
      encoding = "json"
      exclude_middleware = false
    } as $raw_input
  
    db.patch edit_record_issue {
      field_name = "id"
      field_value = $input.edit_record_issue_id
      data = `$input|pick:($raw_input|keys)`|filter_null|filter_empty_text
    } as $model
  }

  response = $model
}