Feature: Lista de bancos

  Background:

   * def result = callonce read('../../backend/security/security.feature@smstoken')
   * header x-wcp-token = java.net.URLEncoder.encode(result.wcp, 'UTF-8')
   * header Cache-Control = 'no-cache'
   * url financialUrl

  @list
  Scenario: Validar lista de bancos

    * def responseApi =
"""
{
  "listOfResult": [
      {
          "nome": "BANCO DO BRASIL S.A.",
          "codigo": 1
      },
      {
          "nome": "BANCO BRADESCO S.A.",
          "codigo": 237
      },
      {
          "nome": "BANCO ITAU S.A.",
          "codigo": 341
      },
      {
          "nome": "CAIXA ECONOMICA FEDERAL",
          "codigo": 104
      },
      {
          "nome": "BANESE",
          "codigo": 47
      },
      {
          "nome": "BANESTES S/A",
          "codigo": 21
      },
      {
          "nome": "BANCO DO ESTADO DO PARA",
          "codigo": 37
      },
      {
          "nome": "CITIBANK",
          "codigo": 745
      },
      {
          "nome": "BANCO SANTANDER",
          "codigo": 33
      },
      {
          "nome": "BANCO SAFRA S/A",
          "codigo": 422
      },
      {
          "nome": "BANCO MERCANTIL DO BRASIL S.A.",
          "codigo": 389
      }
  ],
  "entity": null,
  "responseStatus": {
      "status": true,
      "code": 0,
      "arrayOfMessage": [
          "Operação executada com sucesso"
      ]
  },
  "paginator": null,
  "listOfResponseLink": null
}
"""
    Given path 'bank-list'
	And request {}
    And param gw-app-key = gwappkey
	When method get
	Then status 202
	And match response == responseApi