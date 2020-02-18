Feature: Lista de visitas

  Background:

   * def result = callonce read('../../backend/security/security.feature@smstoken')
   * header x-wcp-token = java.net.URLEncoder.encode(result.wcp, 'UTF-8')
   * header Cache-Control = 'no-cache'
   * url technicianzupUrl

  @diagnosis
  Scenario: Validar lista de visitas

    * def responseApi =
"""
{
"listOfVisits": [

]
}
"""

    Given path 'visit/all/' + operatorcode + '/' + contractnumber
	And request {}
    And param gw-app-key = gwappkey
	When method get
	Then status 200
	And match response == responseApi

  @diagnosiserror
  Scenario: Validar lista de visitas com operator code invalido

    * def responseApi =
"""
{
   "statusCode":"401",
   "status":"Unauthorized",
   "description":"Unauthorized"
}
"""

    Given path 'visit/all/' + "111" + '/' + contractnumber
	And request {}
    And param gw-app-key = gwappkey
	When method get
	Then status 401
	And match response == responseApi

  @diagnosiserror
  Scenario: Validar lista de visitas com contract number invalido

    * def responseApi =
"""
{
   "statusCode":"401",
   "status":"Unauthorized",
   "description":"Unauthorized"
}
"""

    Given path 'visit/all/' + operatorcode + '/' + "111111111"
	And request {}
    And param gw-app-key = gwappkey
	When method get
	Then status 401
	And match response == responseApi