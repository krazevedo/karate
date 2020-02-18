Feature: Franquia

  Background:

   * def resultContract = callonce read('../../claroApp/user/contractlist.feature@list')
   * header Authorization = 'Bearer ' + resultContract.idmtoken + '@' + resultContract.operatorcode + resultContract.contractnumber
   * def consolidated = callonce read('../../claroApp/franchise/consolidated.feature@consolidated')
   * header X-Application-Key = gwappkey
   * header Content-Type = 'application/json'
   * url franchiseUrl

  @pdfconsolidated
  Scenario: Validar consumo

    * def body = consolidated.consolidatedresponse

    Given path '6CB56B7C5586/consumption/consolidated/download/pdf'
	And param product-description = "teste"
	And request body
	When method post
	Then status 200

   @pdfconsolidatederror
   Scenario: Validar consumo

    * def body = consolidated.consolidatedresponse

    Given path '6CB56B7C5586/consumption/consolidated/download/pdf'
    And param product-description = "testetestetestetestetestetestetestetestetestetestetestetes testetestetes testetestetes testetestetes testetestetes testetestetes testetestetes testetestetes testetestetes testetestetes testetestetes testetestetes teste"
   	And request body
	When method post
	Then status 400

   @pdfconsolidatederror
   Scenario: Validar consumo

    * def body = consolidated.consolidatedresponse

    Given path '6CB56B7C5586/consumption/consolidated/download/pdf'
	And param product-description = ""
	And request body
	When method post
	Then status 400

   @pdfconsolidatederror
   Scenario: Validar consumo

    * def body = consolidated.consolidatedresponse

    * def responseApi =
"""
{
    "statusCode":"400",
    "status":"Bad Request",
    "description":"Required String parameter 'product-description' is not present"
}
"""

    Given path '6CB56B7C5586/consumption/consolidated/download/pdf'
	And request body
	When method post
	Then status 400
    And match response == responseApi

   @pdfconsolidatederror1
   Scenario: Validar consumo

    Given path '6CB56B7C5586/consumption/consolidated/download/pdf'
	And param product-description = "teste"
	And request {}
	When method post
	Then status 400