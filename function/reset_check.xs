function resetCheck {
  input {
  }

  stack {
    !db.query "table_name with a space" {
      where = $db.table_name_with_a_space.id == 2
      return = {type: "list"}
    } as $table_name_with_a_space1
  
    !db.direct_query {
      sql = """
        -- Example - Query using mvpw prefix: 
        --   SELECT id, xdo FROM mvpw500_3913 WHERE xdo->>'status' = 'active'; 
        
        -- Note: The mvpw prefix returns raw data structure with id and xdo columns. 
        -- Replace 500 with your workspace ID and 3913 with your table ID. 
        
        -- Example - Query using x prefix:
        --   SELECT * FROM x500_3913 WHERE created_at > NOW() - INTERVAL '7 days'; 
        
        -- Note: The x prefix provides a more readable view with flattened columns. 
        -- Ideal for simple read operations and better readability. 
        -- Does not support write operations.
        
        
        -- Example - Query using custom view:
        --   SELECT * FROM "active_customers" WHERE signup_date > '2025-01-01'; 
        
        -- Note: Replace "active_customers" with your custom view alias. 
        -- Create custom views in database table settings with a Database View Alias. 
        -- Custom views make complex queries more maintainable.
        
        SELECT * from 'test';
        """
      response_type = "list"
    } as $x1
  
    db.edit edit_record_issue {
      field_name = "id"
      field_value = 1
      data = {location: {city: ""}}
    } as $edit_record_issue1
  }

  response = $table_name_with_a_space1
  middleware = {pre: [{name: ""}, {name: ""}]}
}