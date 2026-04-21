task editRecordCheck {
  active = false

  stack {
    db.add edit_record_issue {
      data = {
        created_at: "now"
        name      : "xano"
        metadata  : {}|set:"country":"US"
        active    : false
        location  : {city: "LA"}
      }
    } as $record
  
    db.edit edit_record_issue {
      field_name = "id"
      field_value = $record.id
      data = {active: true}
    } as $edited_record
  }

  schedule = [{starts_on: 2025-10-13 23:52:30+0000, freq: 5}]
}