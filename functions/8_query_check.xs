function queryCheck {
  input {
  }

  stack {
    precondition ((($var.wallets|is_empty) && !(($input.wallet_id|is_empty) && ($input.noExist|is_empty))) == false) {
      error = "Error"
    }
  
    db.get edit_record_issue {
      field_name = "id"
      field_value = ""
    } as $edit_record_issue1
  }

  response = $edit_record_issue1
}