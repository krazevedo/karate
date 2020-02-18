Feature: Franquia

  Background:

   * def result = callonce read('../../claroApp/authentication/signin.feature@login')
   * def detailed = callonce read('../../claroApp/franchise/detailed.feature@detailed')
   * header X-Application-Key = gwappkey
   * header Authorization = 'Bearer ' + result.idmToken + '@' + operatorcode + contractnumber
   * header Content-Type = 'application/json'
   * url franchiseUrl

  @pdfdetailed
  Scenario: Validar consumo

    * def body = detailed.detailedresponse

    Given path '6CB56B7C5586/consumption/detailed/download/pdf'
	And param product-description = "teste"
	And request body
	When method post
	Then status 200

   @pdfdetailederror
   Scenario: Validar consumo

    * def body = detailed.detailedresponse

    Given path '6CB56B7C5586/consumption/detailed/download/pdf'
    And param product-description = "testetestetestetestetestetestetestetestetestetestetestetes testetestetes testetestetes testetestetes testetestetes testetestetes testetestetes testetestetes testetestetes testetestetes testetestetes testetestetes teste"
   	And request body
	When method post
	Then status 400

   @pdfdetailederror
   Scenario: Validar consumo

    * def body = detailed.detailedresponse

    Given path '6CB56B7C5586/consumption/detailed/download/pdf'
	And param product-description = ""
	And request body
	When method post
	Then status 400

   @pdfdetailederror
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

    Given path '6CB56B7C5586/consumption/detailed/download/pdf'
	And request body
	When method post
	Then status 400
    And match response == responseApi

   @pdfdetailederror1
   Scenario: Validar consumo

    Given path '6CB56B7C5586/consumption/detailed/download/pdf'
	And param product-description = "teste"
	And request {}
	When method post
	Then status 400