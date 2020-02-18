Feature: Hit

  Background:

   * def result = callonce read('../../backend/security/security.feature@smstoken')
   * header x-wcp-token = java.net.URLEncoder.encode(result.wcp, 'UTF-8')
   * header Cache-Control = 'no-cache'
   * url technicianUrl

  @hit
  Scenario: Validar hit

    * def responseApi =
"""
{
  "listOfResult": [
    {
      "solicitationId": 337988303,
      "ocCode": "245799528"
    }
  ],
  "entity": null,
  "responseStatus": {
    "status": true,
    "code": null,
    "arrayOfMessage": [
      "Operação executada com sucesso"
    ]
  },
  "paginator": null,
  "listOfResponseLink": null
}
"""

    Given path 'hit' + '/' + operatorcode + '/' + contractnumber
	And request {}
    And param gw-app-key = gwappkey
	When method post
	Then status 202
	And match response == responseApi

  @tentativas
  Scenario: Validar hit

    * def responseApi =
"""
{
  "listOfResult": [
    {
      "solicitationId": 337988303,
      "ocCode": "245799528"
    }
  ],
  "entity": null,
  "responseStatus": {
    "status": false,
    "code": null,
    "arrayOfMessage": [
      "Hit não enviado excesso de tentativas"
    ]
  },
  "paginator": null,
  "listOfResponseLink": null
}
"""

    Given path 'hit' + '/' + operatorcode + '/' + contractnumber
	And request {}
    And param gw-app-key = gwappkey
	When method post
	Then status 202
   * header x-wcp-token = java.net.URLEncoder.encode(result.wcp, 'UTF-8')
   * header Cache-Control = 'no-cache'
	And path 'hit' + '/' + operatorcode + '/' + contractnumber
    And request {}
    And param gw-app-key = gwappkey
    When method post
    Then status 202
   * header x-wcp-token = java.net.URLEncoder.encode(result.wcp, 'UTF-8')
   * header Cache-Control = 'no-cache'
    And path 'hit' + '/' + operatorcode + '/' + contractnumber
    And request {}
    And param gw-app-key = gwappkey
    When method post
    Then status 202
	And match response == responseApi

  @hiterror
  Scenario: Validar hit

    * def responseApi =
"""
{
   "listOfResult":null,
   "entity":null,
   "responseStatus":{
      "status":false,
      "code":null,
      "arrayOfMessage":[
         "Unauthorized"
      ]
   },
   "paginator":null,
   "listOfResponseLink":null
}
"""

    Given path 'hit' + '/' + "111" + '/' + contractnumber
	And request {}
    And param gw-app-key = gwappkey
	When method post
	Then status 401
	And match response == responseApi

  @hiterror
  Scenario: Validar hit

    * def responseApi =
"""
{
   "listOfResult":null,
   "entity":null,
   "responseStatus":{
      "status":false,
      "code":null,
      "arrayOfMessage":[
         "Unauthorized"
      ]
   },
   "paginator":null,
   "listOfResponseLink":null
}
"""

    Given path 'hit' + '/' + operatorcode + '/' + "111111111"
	And request {}
    And param gw-app-key = gwappkey
	When method post
	Then status 401
	And match response == responseApi