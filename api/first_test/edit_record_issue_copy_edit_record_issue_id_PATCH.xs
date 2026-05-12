query "edit_record_issue/copy/{edit_record_issue_id}" verb=PATCH {
  api_group = "first test"

  input {
    text name? filters=trim
    bool active?
    int id?
  }

  stack {
    !db.edit edit_record_issue {
      field_name = "id"
      field_value = $input.id
      data = {active: $input.active}
    } as $edit_record_issue1
  
    db.patch edit_record_issue {
      field_name = "id"
      field_value = $input.id
      data = {}|set:"active":$input.active
    } as $edit_record_issue1
  }

  response = $edit_record_issue1
}