Feature: Lista datas de expiração

  Background:

   * def result = callonce read('../../backend/security/security.feature@smstoken')
   * header x-wcp-token = java.net.URLEncoder.encode(result.wcp, 'UTF-8')
   * header Cache-Control = 'no-cache'
   * url financialUrl

  @expirationdate
  Scenario: Validar lista de datas de expiração

    * def responseApi =
"""
{
  "listOfResult": [
    {
      "id": "3",
      "value": "8"
    },
    {
      "id": "2",
      "value": "20"
    },
    {
      "id": "1",
      "value": "10"
    },
    {
      "id": "4",
      "value": "15"
    },
    {
      "id": "9",
      "value": "5"
    },
    {
      "id": "25",
      "value": "25"
    }
  ],
  "entity": null,
  "responseStatus": {
    "status": true,
    "code": 0,
    "arrayOfMessage": [
      "Operação executada com sucesso"
    ]
  },
  "paginator": null,
  "listOfResponseLink": null
}
"""
    Given path 'list-expiration-dates'
	And request {}
    And param gw-app-key = gwappkey
	When method get
	Then status 202
	And match response == responseApi