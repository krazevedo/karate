Feature: Verificar se a APi está de pé

  Background:

   * url userUrl
   * header Cacne-Control = 'no-cache'

  @health
  Scenario: Validar saúde da API

    * def responseApi =
"""
{
    "status":true,
    buildNumber:'#string'
}
"""
    Given path 'health'
	And param gw-app-key = gwappkey
	And request {}
	When method get
	Then status 200
	And match response == responseApi