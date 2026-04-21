addon dummy_data {
  input {
    int dummy_data_id? {
      table = "dummy_data"
    }
  }

  stack {
    db.query dummy_data {
      where = $db.dummy_data.id == $input.dummy_data_id
      return = {type: "single"}
    }
  }
}