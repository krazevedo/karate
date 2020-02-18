Feature: Histórico de pagamentos

  Background:

   * def result = callonce read('../../backend/security/security.feature@smstoken')
   * header x-wcp-token = java.net.URLEncoder.encode(result.wcp, 'UTF-8')
   * header Cache-Control = 'no-cache'
   * url financialUrl

  @history
  Scenario: Historico de pagamento


    * def responseApi =
"""
{
  "listOfResult": [
    {
      "identificator": "171612148",
      "clientIdentificator": {
        "id": null,
        "name": null,
        "contractNumber": "019181308",
        "document": null,
        "email": null,
        "statusIdentifier": null,
        "statusIdentifierDescription": null,
        "codeCity": null,
        "operatorCod": "052",
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
        "tvdigital": false,
        "phone": false,
        "clientTypePJ": false,
        "clientTypePF": false,
        "broadBand": false,
        "tvanalogic": false
      },
      paymentStatus: "#string",
      "documentNumber": "3382410",
      "expirationDate": 1576378800000,
      "value": 236.33,
      "paymentType": "BILLET",
      "keycode": "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJjb250cmFjdE51bWJlciI6IjAxOTE4MTMwOCIsIm9wZXJhdG9yQ29kIjoiMDUyIiwicGF5bWVudElkZW50aWZpY2F0b3IiOiIxNzE2MTIxNDgifQ.wI7TeAwWWE868xKNth_OvUvrqmeSTtOitqwytw2uYd4",
      "codeBar": null
    }
  ],
  "entity": null,
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
    Given path 'payment-history/' + operatorcode + '/' + contractnumber
	And request {}
    And param gw-app-key = gwappkey
	When method get
	Then status 202
	And match response == responseApi
	And def keycode = response.listOfResult[0].keycode

  @historyerror
  Scenario: Historico de pagamento

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
    Given path 'payment-history/' + "111" + '/' + contractnumber
	And request {}
    And param gw-app-key = gwappkey
	When method get
	Then status 401
	And match response == responseApi

  @historyerror
  Scenario: Historico de pagamento

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
    Given path 'payment-history/' + operatorcode + '/' +  '111111111'
	And request {}
    And param gw-app-key = gwappkey
	When method get
	Then status 401
	And match response == responseApi