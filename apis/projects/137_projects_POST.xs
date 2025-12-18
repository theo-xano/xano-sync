// Add projects record
query projects verb=POST {
  api_group = "projects"
  auth = "user"

  input {
    dblink {
      table = "projects"
    }
  }

  stack {
    db.add projects {
      data = {
        created_at       : "now"
        name             : $input.name
        description      : $input.description
        duration_in_weeks: $input.duration_in_weeks
      }
    } as $model
  }

  response = $model

  test test1 {
    input = {
      name              : ""
      description       : ""
      duration_in_weekss: ""
    }
  }
}