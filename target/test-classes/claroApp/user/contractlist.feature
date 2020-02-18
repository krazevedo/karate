Feature: Lista de contratos

  Background:

   * def result = callonce read('../../claroApp/authentication/signin.feature@login')
   * header Content-Type = 'application/json'
   * header userInfo = java.net.URLEncoder.encode(result.userInfo, 'UTF-8')
   * header x-application-key = xappkey
   * header gw-app-key = gwappkey
   * header Cache-Control = 'no-cache'
   * url userUrl

  @list
  Scenario: Documento válido

    * def responseApi =
"""
{
  contracts: '#[]? _.length == 4'
}
"""
    Given path 'contract'
	And request {}
	When method get
	Then status 200
	And match response == responseApi
	And def contractnumber = response.contracts[0].contractNumber
	And def operatorcode = response.contracts[0].operatorCode
	And def userinfo = result.userInfo
    And def idmtoken = result.idmToken