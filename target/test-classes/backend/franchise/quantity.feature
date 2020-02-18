Feature: Franquia

  Background:

   * def result = callonce read('../../claroApp/authentication/signin.feature@login')
   * header X-Application-Key = gwappkey
   * header Authorization = 'Bearer ' + result.idmToken + '@' + operatorcode + contractnumber
   * header Content-Type = 'application/json'
   * url franchiseUrl

  @franchise
  Scenario: Validar consumo

    * def responseApi =
"""
{
    "dataConsumptionLimit": "100"
}
"""

    Given path '6CB56B7C5586'
	When method get
	Then status 200
	And match response == responseApi

   @franchiseerror
   Scenario: Validar consumo

       * def responseApi =
   """
   {
       "dataConsumptionLimit": null
   }
   """

    Given path '6CB56B7C5580'
    When method get
	Then status 200
	And match response == responseApi