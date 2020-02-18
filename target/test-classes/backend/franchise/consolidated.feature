Feature: Franquia

  Background:

   * def resultContract = callonce read('../../claroApp/user/contractlist.feature@list')
   * header Authorization = 'Bearer ' + resultContract.idmtoken + '@' + resultContract.operatorcode + resultContract.contractnumber
   * header X-Application-Key = gwappkey
   * header Content-Type = 'application/json'
   * url franchiseUrl

  @consolidated
  Scenario: Validar consumo

  * def responseApi =
"""
{
   "consumptionHistory":[
      {
         "consumptionFinalDate":"2019-02-28T00:00:00",
         "usedBroadband":"76.79",
         "contractedBroadband":"0",
         "availableBroadband":"-56.79",
         "usedPercentageFromTotal":"383.95",
         "relatedMonth":"fevereiro"
      },
      {
         "consumptionFinalDate":"2019-03-20T00:00:00",
         "usedBroadband":"60.26",
         "contractedBroadband":"0",
         "availableBroadband":"-40.26",
         "usedPercentageFromTotal":"301.3",
         "relatedMonth":"março"
      }
   ],
   "signature":{
      "value":"AbG8ljSVgzcObEUSlTDi7tMm-DaHkrliFB07XGyGFRHJgGf5sZPNQzw6gknPtGtQMaz_n00gWqRvEg3-d6txJA"
   }
}
"""

    Given path mac + '/consumption/consolidated'
	And param initial-date = "2019-02-20"
	And param final-date = "2019-03-20"
	When method get
	Then status 200
	And match response == responseApi
	And def consolidatedresponse = response

   @consolidatederror
   Scenario: Validar consumo

   * def responseApi =
 """
{
   "statusCode":"400",
   "status":"Bad Request",
   "description":"400 BAD_REQUEST \"O(s) campo(s) mesInicio, mesFim,  contém a Data Fim menor que Data Início.\""
}
 """

    Given path '6CB56B7C5586/consumption/consolidated'
 	And param initial-date = "2019-04-20"
 	And param final-date = "2019-03-20"
 	When method get
 	Then status 400
 	And match response == responseApi

   @consolidatederror
   Scenario: Validar consumo

   * def responseApi =
 """
{
   "statusCode":"400",
   "status":"Bad Request",
   "description":"400 BAD_REQUEST \"O(s) campo(s) mesFim,  contém formato de data inválido.\""
}
 """

    Given path '6CB56B7C5586/consumption/consolidated'
 	And param initial-date = "2019-04-20"
 	And param final-date = "2019-13-20"
 	When method get
 	Then status 400
 	And match response == responseApi

   @consolidatederror
   Scenario: Validar consumo

   * def responseApi =
 """
 {
    "statusCode":"400",
    "status":"Bad Request",
    "description":"400 BAD_REQUEST \"O(s) campo(s) mesInicio,  contém formato de data inválido.\""
 }
 """

    Given path '6CB56B7C5586/consumption/consolidated'
 	And param initial-date = "2019-13-20"
 	And param final-date = "2020-03-20"
 	When method get
 	Then status 400
 	And match response == responseApi

    @consolidatederror
    Scenario: Validar consumo

    * def responseApi =
  """
  {
     "statusCode":"400",
     "status":"Bad Request",
     "description":"400 BAD_REQUEST \"O campo mesInicio é obrigatório.\""
  }
  """

    Given path '6CB56B7C5586/consumption/consolidated'
  	And param initial-date = ""
  	And param final-date = "2020-03-20"
  	When method get
  	Then status 400
  	And match response == responseApi

    @consolidatederror1
    Scenario: Validar consumo

    * def responseApi =
  """
  {
     "statusCode":"400",
     "status":"Bad Request",
     "description":"400 BAD_REQUEST \"O campo mesFim é obrigatório.\""
  }
  """

    Given path '6CB56B7C5586/consumption/consolidated'
  	And param initial-date = "2019-11-20"
  	And param final-date = ""
  	When method get
  	Then status 400
  	And match response == responseApi