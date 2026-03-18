table "⚙️Settings" {
  auth = false

  schema {
    int id
    text name? filters=trim
  }

  index = [{type: "primary", field: [{name: "id"}]}]
}