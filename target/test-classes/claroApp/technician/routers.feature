Feature: Lista de roteadores

  Background:

   * def result = callonce read('../../backend/security/security.feature@smstoken')
   * header x-wcp-token = java.net.URLEncoder.encode(result.wcp, 'UTF-8')
   * header Cache-Control = 'no-cache'
   * url technicianzupUrl

  @routers
  Scenario: Validar lista de roteadores

    * def responseApi =
"""
{
  "routers": [
    {
      "status": "Online",
      "ip": "10.31.13.18",
      "vendor": "HUMAX",
      "model": "HG100R-L2",
      "macAddress": "6CB56B7C5586",
      "wifi": true
    }
  ]
}
"""

    Given path 'routers/' + operatorcode + '/' + contractnumber
	And request {}
    And param gw-app-key = xappkey
	When method get
	Then status 200
	And match response == responseApi

  @routerserror
  Scenario: Validar lista de roteadores

    * def responseApi =
"""
{
   "statusCode":"412",
   "status":"Precondition Failed",
   "description":" Não foi possível consultar as informações do seu equipamento. Por favor tente novamente mais tarde!"
}
"""

    Given path 'routers/' + "111" + '/' + contractnumber
	And request {}
    And param gw-app-key = gwappkey
	When method get
	Then status 412
	And match response == responseApi

  @routerserror
  Scenario: Validar lista de roteadores

    * def responseApi =
"""
{
   "statusCode":"401",
   "status":"Unauthorized",
   "description":"Não Autorizado"
}
"""

    Given path 'routers/' + operatorcode + '/' + "111111111"
	And request {}
    And param gw-app-key = gwappkey
	When method get
	Then status 401
	And match response == responseApi