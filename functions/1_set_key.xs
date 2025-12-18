function "set-key" {
  input {
  }

  stack {
    redis.set {
      key = "redisKeyNew"
      data = "isolation-enabled-forSure"
      ttl = 0
    }
  }

  response = null
}