Feature: Franquia

  Background:

   * def result = callonce read('../../claroApp/authentication/signin.feature@login')
   * def detailed = callonce read('../../claroApp/franchise/detailed.feature@detailed')
   * header X-Application-Key = gwappkey
   * header Authorization = 'Bearer ' + result.idmToken + '@' + operatorcode + contractnumber
   * header Content-Type = 'application/json'
   * url franchiseUrl

  @emaildetailed
  Scenario: Validar consumo

  * def body = detailed.detailedresponse

    Given path '6CB56B7C5586/consumption/detailed/send/email'
	And param product-description = "teste"
	And param destination = "kaio.azevedo@dextra-sw.com"
	And param client-name = "Kaio"
    And param test-flag = "true"
	And request body
	When method post
	Then status 204

   @emaildetailederror
   Scenario: Validar consumo

  * def body = detailed.detailedresponse

    Given path '6CB56B7C5586/consumption/detailed/send/email'
    And param product-description = "testetestetestetestetestetestetestetestetestetestetestetes testetestetes testetestetes testetestetes testetestetes testetestetes testetestetes testetestetes testetestetes testetestetes testetestetes testetestetes teste"
    And param destination = "kaio.azevedo@dextra-sw.com"
    And param client-name = "testetestetestetestetestetestetestetestetestetestetestetes testetestetes testetestetes testetestetes testetestetes testetestetes testetestetes testetestetes testetestetes testetestetes testetestetes testetestetes teste"
	And request body
	When method post
	Then status 400

   @emaildetailederror
   Scenario: Validar consumo

    * def body = detailed.detailedresponse

    Given path '6CB56B7C5586/consumption/detailed/send/email'
	And param product-description = ""
	And param destination = "kaio.azevedo@dextra-sw.com"
	And param client-name = "Kaio"
	And param test-flag = "true"
	And request body
	When method post
	Then status 400

   @emaildetailederror
   Scenario: Validar consumo

    * def body = detailed.detailedresponse

    Given path '6CB56B7C5586/consumption/detailed/send/email'
	And param product-description = "teste"
	And param destination = ""
	And param client-name = "Kaio"
	And param test-flag = "true"
	And request body
	When method post
	Then status 400

   @emaildetailederror
   Scenario: Validar consumo

    * def body = detailed.detailedresponse

    Given path '6CB56B7C5586/consumption/detailed/send/email'
	And param product-description = "teste"
	And param destination = "kaio.azevedo@dextra-sw.com"
	And param client-name = ""
	And param test-flag = "true"
	And request body
	When method post
	Then status 400

   @emaildetailederror
   Scenario: Validar consumo

    * def body = detailed.detailedresponse

    * def responseApi =
"""
{
    "statusCode":"400",
    "status":"Bad Request",
    "description":"Required String parameter 'product-description' is not present"
}
"""

    Given path '6CB56B7C5586/consumption/detailed/send/email'
	And param destination = "kaio.azevedo@dextra-sw.com"
	And param client-name = "Kaio"
	And param test-flag = "true"
	And request body
	When method post
	Then status 400
    And match response == responseApi

   @emaildetailederror
   Scenario: Validar consumo

    * def body = detailed.detailedresponse

    * def responseApi =
"""
{
    "statusCode":"400",
    "status":"Bad Request",
    "description":"Required String parameter 'destination' is not present"
}
"""

    Given path '6CB56B7C5586/consumption/detailed/send/email'
    And param product-description = "teste"
	And param client-name = "Kaio"
	And param test-flag = "true"
	And request body
	When method post
	Then status 400
    And match response == responseApi

   @emaildetailederror
   Scenario: Validar consumo

    * def body = detailed.detailedresponse

    * def responseApi =
"""
{
    "statusCode":"400",
    "status":"Bad Request",
    "description":"Required String parameter 'client-name' is not present"
}
"""

    Given path '6CB56B7C5586/consumption/detailed/send/email'
    And param product-description = "teste"
    And param destination = "kaio.azevedo@dextra-sw.com"
	And param test-flag = "true"
	And request body
	When method post
	Then status 400
    And match response == responseApi

   @emaildetailederror
   Scenario: Validar consumo

    Given path '6CB56B7C5586/consumption/detailed/send/email'
	And param product-description = "teste"
	And param destination = "kaio.azevedo@dextra-sw.com"
	And param client-name = "Kaio"
	And param test-flag = "true"
	And request {}
	When method post
	Then status 400