task startDateTest {
  active = false

  stack {
    api.request {
      url = "https://webhook.site/34f96350-5697-4044-b10f-eb3ba79927a6"
      method = "GET"
    } as $api1
  }

  schedule = [{starts_on: 2025-12-05 23:46:58+0000, freq: 120}]
}