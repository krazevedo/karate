Feature: Ouvidoria

  Background:

   * def result = callonce read('../../claroApp/authentication/signin.feature@login') { username: 'Net.web', password: 'Net.123' }
   * header Authorization = 'Bearer ' + result.idmToken + '@' + '003' + '349338695'
   * header X-Application-Key = gwappkey
   * header Content-Type = 'application/json'
   * url ombudsmanUrl

  @ombudsman
  Scenario: Validar criação dos protocolos

    * def body =
"""
[
  {
    "recordType": "CEC_CC_TELE",
    "reason": "MOTIVO",
    "description": "Descricao do motivo",
    "msisdn": "11994453321",
    "additionalInformation": "Informacoes adicionais do caso.",
    "contactName": "Baltazar Barata",
    "emailAddress": "16137065022",
    "businessUnit": "NET",
    "grouping": "Ouvidoria",
    "salesChannelId": "Ouvidoria",
    "inputType": "Formulario Minha Claro"
  }
]
"""
    Given path '40432544086009/protocols/2019/003194377204993/ombudsman-tickets'
    And request body
	When method post
	Then status 200

  @ombudsman
  Scenario: Validar criação dos protocolos com documento inválido

    * def body =
"""
[
  {
    "recordType": "CEC_CC_TELE",
    "reason": "MOTIVO",
    "description": "Descricao do motivo",
    "msisdn": "11994453321",
    "additionalInformation": "Informacoes adicionais do caso.",
    "contactName": "Baltazar Barata",
    "emailAddress": "16137065022",
    "businessUnit": "NET",
    "grouping": "Ouvidoria",
    "salesChannelId": "Ouvidoria",
    "inputType": "Formulario Minha Claro"
  }
]
"""
    * def responseApi =
"""
{
    "statusCode":"400",
    "status":"Bad Request",
    "description":"Documento inválido!"
}
"""
    Given path '1/protocols/2019/003194377204993/ombudsman-tickets'
    And request body
	When method post
	Then status 400
    And match response === responseApi

  @ombudsman1
  Scenario: Validar criação dos protocolos com ano inválido

    * def body =
"""
[
  {
    "recordType": "CEC_CC_TELE",
    "reason": "MOTIVO",
    "description": "Descricao do motivo",
    "msisdn": "11994453321",
    "additionalInformation": "Informacoes adicionais do caso.",
    "contactName": "Baltazar Barata",
    "emailAddress": "16137065022",
    "businessUnit": "NET",
    "grouping": "Ouvidoria",
    "salesChannelId": "Ouvidoria",
    "inputType": "Formulario Minha Claro"
  }
]
"""
    Given path '40432544086009/protocols/0/003194377204993/ombudsman-tickets'
    And request body
	When method post
	Then status 400

  @ombudsman
  Scenario: Validar criação dos protocolos com número de protocolo inválido

    * def body =
"""
[
  {
    "recordType": "CEC_CC_TELE",
    "reason": "MOTIVO",
    "description": "Descricao do motivo",
    "msisdn": "11994453321",
    "additionalInformation": "Informacoes adicionais do caso.",
    "contactName": "Baltazar Barata",
    "emailAddress": "16137065022",
    "businessUnit": "NET",
    "grouping": "Ouvidoria",
    "salesChannelId": "Ouvidoria",
    "inputType": "Formulario Minha Claro"
  }
]
"""
    Given path '40432544086009/protocols/2019/1/ombudsman-tickets'
    And request body
	When method post
	Then status 400