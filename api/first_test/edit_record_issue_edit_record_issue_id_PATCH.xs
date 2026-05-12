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
    db.edit edit_record_issue {
      field_name = "id"
      field_value = $input.edit_record_issue_id
      data = {active: $input.active}
    } as $edit_record_issue1
  }

  response = $input.edit_record_issue_id
}