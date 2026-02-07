realtime_channel test {
  public_messaging = {auth: false}
  private_messaging = {active: false}
  settings = {
    anonymous_clients: true
    nested_channels  : false
    message_history  : 50
    auth_channel     : false
    presence         : false
  }
}