Feature: Lista de Interrupções

  Background:

   * def result = callonce read('../../backend/security/security.feature@smstoken')
   * header x-wcp-token = java.net.URLEncoder.encode(result.wcp, 'UTF-8')
   * header Cache-Control = 'no-cache'
   * url technicianv2Url

  @outage
  Scenario: Validar lista de interrupções

    * def responseApi =
"""
{
  "products": [],
  "defaultTitle": null,
  "defaultMessage": null,
  "defaultStatus": null
}
"""

    Given path 'outage' + '/' + operatorcode + '/' + node + '/' + city + '/' + codimovel
	And request {}
    And param gw-app-key = gwappkey
	When method get
	Then status 200
	And match response == responseApi

  @outageerror
  Scenario: Validar lista de interrupções

    * def responseApi =
"""
{
  "products": [],
  "defaultTitle": null,
  "defaultMessage": null,
  "defaultStatus": null
}
"""

    Given path 'outage' + '/' + "111" + '/' + node + '/' + city + '/' + codimovel
	And request {}
    And param gw-app-key = gwappkey
	When method get
	Then status 401
	And match response == responseApi

  @outageerror
  Scenario: Validar lista de interrupções

    * def responseApi =
"""
{
  "products": [],
  "defaultTitle": null,
  "defaultMessage": null,
  "defaultStatus": null
}
"""

    Given path 'outage' + '/' + operatorcode + '/' + 'dnsausdaib!@<>' + '/' + city + '/' + codimovel
	And request {}
    And param gw-app-key = gwappkey
	When method get
	Then status 400
	And match response == responseApi

  @outageerror
  Scenario: Validar lista de interrupções

    * def responseApi =
"""
{
  "products": [],
  "defaultTitle": null,
  "defaultMessage": null,
  "defaultStatus": null
}
"""

    Given path 'outage' + '/' + operatorcode + '/' + node + '/' + "00000" + '/' + codimovel
	And request {}
    And param gw-app-key = gwappkey
	When method get
	Then status 401
	And match response == responseApi

  @outageerror
  Scenario: Validar lista de interrupções

    * def responseApi =
"""
{
  "products": [],
  "defaultTitle": null,
  "defaultMessage": null,
  "defaultStatus": null
}
"""

    Given path 'outage' + '/' + operatorcode + '/' + node + '/' + city + '/' + 'fdiuidsuhsfdihsdhi12345678890'
	And request {}
    And param gw-app-key = gwappkey
	When method get
	Then status 400
	And match response == responseApi