// Add edit_record_issue record
query "edit_record_issue/some_endpoint/save" verb=POST {
  api_group = "first test"

  input {
    dblink {
      table = "edit_record_issue"
    }
  }

  stack {
    db.add edit_record_issue {
      data = {
        created_at: "now"
        name      : $input.name
        location  : $input.location
        metadata  : $input.metadata
        active    : $input.active
      }
    } as $model
  }

  response = $model
}