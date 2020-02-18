Feature: Informação de cobrança

  Background:

   * def result = callonce read('../../backend/security/security.feature@smstoken')
   * header x-wcp-token = java.net.URLEncoder.encode(result.wcp, 'UTF-8')
   * header Cache-Control = 'no-cache'
   * url financialUrl

  @billing
  Scenario: Validar informações de cobrança


    * def responseApi =
"""
{
   "listOfResult": null,
   "entity": {
     "clientIdentificator": {
       "id": null,
       "name": null,
       "contractNumber": "019181308",
       "document": null,
       "email": null,
       "statusIdentifier": null,
       "statusIdentifierDescription": null,
       "codeCity": "05509",
       "operatorCod": null,
       "contractType": null,
       "clientTypeId": null,
       "clientSegmentType": null,
       "clientSegmentTypeDescription": null,
       "codImovel": null,
       "node": null,
       "docCpf": null,
       "docCnpj": null,
       "blockedPayPromise": null,
       "paymentType": null,
       "dayOfPayment": null,
       "phone": false,
       "clientTypePJ": false,
       "clientTypePF": false,
       "broadBand": false,
       "tvanalogic": false,
       "tvdigital": false
     },
     "paymentType": "BILLET",
     "paymentDelivery": "EMAIL",
     "financialOrganization": null
   },
   "responseStatus": {
     "status": true,
     "code": null,
     "arrayOfMessage": [
       "Operação executada com sucesso"
     ]
   },
   "paginator": null,
   "listOfResponseLink": null
 }
"""
    Given path 'billing-information'
	And request {}
    And param gw-app-key = gwappkey
    And param contractNumber = contractnumber
    And param cityId = city
	When method get
	Then status 202
	And match response == responseApi

  @billingerror
  Scenario: Validar informações de cobrança


    * def responseApi =
"""
{
   "listOfResult":null,
   "entity":null,
   "responseStatus":{
      "status":false,
      "code":null,
      "arrayOfMessage":[
         "Unauthorized"
      ]
   },
   "paginator":null,
   "listOfResponseLink":null
}
"""
    Given path 'billing-information'
	And request {}
    And param gw-app-key = gwappkey
    And param contractNumber = "111111111"
    And param cityId = city
	When method get
	Then status 401
	And match response == responseApi

  @billingerror
  Scenario: Validar informações de cobrança


    * def responseApi =
"""
{
   "listOfResult":null,
   "entity":null,
   "responseStatus":{
      "status":false,
      "code":null,
      "arrayOfMessage":[
         "Unauthorized"
      ]
   },
   "paginator":null,
   "listOfResponseLink":null
}
"""
    Given path 'billing-information'
	And request {}
    And param gw-app-key = gwappkey
    And param contractNumber = contractnumber
    And param cityId = "11111"
	When method get
	Then status 401
	And match response == responseApi