Feature: Franquia

  Background:

   * def resultContract = callonce read('../../claroApp/user/contractlist.feature@list')
   * header Authorization = 'Bearer ' + resultContract.idmtoken + '@' + resultContract.operatorcode + resultContract.contractnumber
   * header X-Application-Key = gwappkey
   * header Content-Type = 'application/json'
   * url franchiseUrl

  @detailed
  Scenario: Validar consumo

  * def responseApi =
"""
{
   "consumptionHistory":[
      {
         "relatedDate":"2019-02-20T00:00:00",
         "usedBroadband":"4.89",
         "contractedBroadband":"0",
         "availableBroadband":"-33.17",
         "usedPercentageFromTotal":"265.85"
      },
      {
         "relatedDate":"2019-02-21T00:00:00",
         "usedBroadband":"3.48",
         "contractedBroadband":"0",
         "availableBroadband":"-36.65",
         "usedPercentageFromTotal":"283.25"
      },
      {
         "relatedDate":"2019-02-22T00:00:00",
         "usedBroadband":"1.63",
         "contractedBroadband":"0",
         "availableBroadband":"-38.28",
         "usedPercentageFromTotal":"291.4"
      },
      {
         "relatedDate":"2019-02-23T00:00:00",
         "usedBroadband":"4.68",
         "contractedBroadband":"0",
         "availableBroadband":"-42.96",
         "usedPercentageFromTotal":"314.8"
      },
      {
         "relatedDate":"2019-02-24T00:00:00",
         "usedBroadband":"3.98",
         "contractedBroadband":"0",
         "availableBroadband":"-46.94",
         "usedPercentageFromTotal":"334.7"
      },
      {
         "relatedDate":"2019-02-25T00:00:00",
         "usedBroadband":"3.04",
         "contractedBroadband":"0",
         "availableBroadband":"-49.98",
         "usedPercentageFromTotal":"349.9"
      },
      {
         "relatedDate":"2019-02-26T00:00:00",
         "usedBroadband":"2.23",
         "contractedBroadband":"0",
         "availableBroadband":"-52.21",
         "usedPercentageFromTotal":"361.05"
      },
      {
         "relatedDate":"2019-02-27T00:00:00",
         "usedBroadband":"2.83",
         "contractedBroadband":"0",
         "availableBroadband":"-55.04",
         "usedPercentageFromTotal":"375.2"
      },
      {
         "relatedDate":"2019-02-28T00:00:00",
         "usedBroadband":"1.75",
         "contractedBroadband":"0",
         "availableBroadband":"-56.79",
         "usedPercentageFromTotal":"383.95"
      },
      {
         "relatedDate":"2019-03-01T00:00:00",
         "usedBroadband":"2.21",
         "contractedBroadband":"0",
         "availableBroadband":"17.79",
         "usedPercentageFromTotal":"11.05"
      },
      {
         "relatedDate":"2019-03-02T00:00:00",
         "usedBroadband":"8.34",
         "contractedBroadband":"0",
         "availableBroadband":"9.45",
         "usedPercentageFromTotal":"52.75"
      },
      {
         "relatedDate":"2019-03-03T00:00:00",
         "usedBroadband":"4.92",
         "contractedBroadband":"0",
         "availableBroadband":"4.53",
         "usedPercentageFromTotal":"77.35"
      },
      {
         "relatedDate":"2019-03-04T00:00:00",
         "usedBroadband":"3.34",
         "contractedBroadband":"0",
         "availableBroadband":"1.19",
         "usedPercentageFromTotal":"94.05"
      },
      {
         "relatedDate":"2019-03-05T00:00:00",
         "usedBroadband":"2.87",
         "contractedBroadband":"0",
         "availableBroadband":"-1.68",
         "usedPercentageFromTotal":"108.4"
      },
      {
         "relatedDate":"2019-03-06T00:00:00",
         "usedBroadband":"2.16",
         "contractedBroadband":"0",
         "availableBroadband":"-3.84",
         "usedPercentageFromTotal":"119.2"
      },
      {
         "relatedDate":"2019-03-07T00:00:00",
         "usedBroadband":"1.51",
         "contractedBroadband":"0",
         "availableBroadband":"-5.35",
         "usedPercentageFromTotal":"126.75"
      },
      {
         "relatedDate":"2019-03-08T00:00:00",
         "usedBroadband":"2.19",
         "contractedBroadband":"0",
         "availableBroadband":"-7.54",
         "usedPercentageFromTotal":"137.7"
      },
      {
         "relatedDate":"2019-03-09T00:00:00",
         "usedBroadband":"3.39",
         "contractedBroadband":"0",
         "availableBroadband":"-10.93",
         "usedPercentageFromTotal":"154.65"
      },
      {
         "relatedDate":"2019-03-10T00:00:00",
         "usedBroadband":"2.68",
         "contractedBroadband":"0",
         "availableBroadband":"-13.61",
         "usedPercentageFromTotal":"168.05"
      },
      {
         "relatedDate":"2019-03-11T00:00:00",
         "usedBroadband":"6.23",
         "contractedBroadband":"0",
         "availableBroadband":"-19.84",
         "usedPercentageFromTotal":"199.2"
      },
      {
         "relatedDate":"2019-03-12T00:00:00",
         "usedBroadband":"2.42",
         "contractedBroadband":"0",
         "availableBroadband":"-22.26",
         "usedPercentageFromTotal":"211.3"
      },
      {
         "relatedDate":"2019-03-13T00:00:00",
         "usedBroadband":"1.6",
         "contractedBroadband":"0",
         "availableBroadband":"-23.86",
         "usedPercentageFromTotal":"219.3"
      },
      {
         "relatedDate":"2019-03-14T00:00:00",
         "usedBroadband":"2.75",
         "contractedBroadband":"0",
         "availableBroadband":"-26.61",
         "usedPercentageFromTotal":"233.05"
      },
      {
         "relatedDate":"2019-03-15T00:00:00",
         "usedBroadband":"2.89",
         "contractedBroadband":"0",
         "availableBroadband":"-29.5",
         "usedPercentageFromTotal":"247.5"
      },
      {
         "relatedDate":"2019-03-16T00:00:00",
         "usedBroadband":"6.22",
         "contractedBroadband":"0",
         "availableBroadband":"-35.72",
         "usedPercentageFromTotal":"278.6"
      },
      {
         "relatedDate":"2019-03-18T00:00:00",
         "usedBroadband":"0.01",
         "contractedBroadband":"0",
         "availableBroadband":"-35.73",
         "usedPercentageFromTotal":"278.65"
      },
      {
         "relatedDate":"2019-03-19T00:00:00",
         "usedBroadband":"1.97",
         "contractedBroadband":"0",
         "availableBroadband":"-37.7",
         "usedPercentageFromTotal":"288.5"
      },
      {
         "relatedDate":"2019-03-20T00:00:00",
         "usedBroadband":"2.56",
         "contractedBroadband":"0",
         "availableBroadband":"-40.26",
         "usedPercentageFromTotal":"301.3"
      }
   ],
   "signature":{
      "value":"LhTlUMYYG8mgMf7XY4F83uAOl3oDMIrL0qOvXnqXRaACbjvZxNspvSU5aruZ9loS4A46MadrfZh2ukIZZd3v2w"
   }
}
"""

    Given path '6CB56B7C5586/consumption/detailed'
	And param initial-date = "2019-02-20"
	And param final-date = "2019-03-20"
	When method get
	Then status 200
	And match response == responseApi
	And def detailedresponse = response

   @detailederror
   Scenario: Validar consumo

   * def responseApi =
 """
{
   "statusCode":"400",
   "status":"Bad Request",
   "description":"400 BAD_REQUEST \"O(s) campo(s) dataInicio, dataFim,  contém a Data Fim menor que Data Início.\""
}
 """

    Given path '6CB56B7C5586/consumption/detailed'
 	And param initial-date = "2019-04-20"
 	And param final-date = "2019-03-20"
 	When method get
 	Then status 400
 	And match response == responseApi

   @detailederror
   Scenario: Validar consumo

   * def responseApi =
 """
{
   "statusCode":"400",
   "status":"Bad Request",
   "description":"400 BAD_REQUEST \"O(s) campo(s) mesFim,  contém formato de data inválido.\""
}
 """

    Given path '6CB56B7C5586/consumption/detailed'
 	And param initial-date = "2019-04-20"
 	And param final-date = "2019-13-20"
 	When method get
 	Then status 400
 	And match response == responseApi

   @detailederror
   Scenario: Validar consumo

   * def responseApi =
 """
 {
    "statusCode":"400",
    "status":"Bad Request",
    "description":"400 BAD_REQUEST \"O(s) campo(s) mesInicio,  contém formato de data inválido.\""
 }
 """

    Given path '6CB56B7C5586/consumption/detailed'
 	And param initial-date = "2019-13-20"
 	And param final-date = "2020-03-20"
 	When method get
 	Then status 400
 	And match response == responseApi

    @detailederror
    Scenario: Validar consumo

    * def responseApi =
  """
  {
     "statusCode":"400",
     "status":"Bad Request",
     "description":"400 BAD_REQUEST \"O campo mesInicio é obrigatório.\""
  }
  """

    Given path '6CB56B7C5586/consumption/detailed'
  	And param initial-date = ""
  	And param final-date = "2020-03-20"
  	When method get
  	Then status 400
  	And match response == responseApi

    @detailederror
    Scenario: Validar consumo

    * def responseApi =
  """
  {
     "statusCode":"400",
     "status":"Bad Request",
     "description":"400 BAD_REQUEST \"O campo mesFim é obrigatório.\""
  }
  """

    Given path '6CB56B7C5586/consumption/detailed'
  	And param initial-date = "2019-11-20"
  	And param final-date = ""
  	When method get
  	Then status 400
  	And match response == responseApi