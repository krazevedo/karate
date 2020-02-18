Feature: Gerenciamento de dispositivos

  Background:

    * def result = callonce read('../../claroApp/authentication/signin.feature@login')
    * header Authorization = 'Bearer ' + result.idmToken
    * header X-Application-Key = xappkey
    * url inventoryUrl

  @device
  Scenario: Validar lista de dispositivos

    * def responseApi =
"""
[
  {
    "deviceName": "Windows",
    "deviceId": "MDA6MDU6MTY6NTk6ZjE6NjM%3D",
    "expirationDate": "2020-01-25T13:02:17Z",
    "creationDate": "2019-10-25T13:02:18Z",
    "browserName": "Chrome"
  }
]
"""
    * header document = document
    Given path 'device-management'
	When method get
	Then status 200
    And match response == responseApi

  @deviceerror1
  Scenario: Validar erro ao enviar documento inválido

    * header document = 'adasdasdasdassdsa'
    Given path 'device-management'
	When method get
	Then status 404

  @deviceerror2
  Scenario: Validar erro ao enviar documento nulo

    * def responseApi =
"""
{
   "statusCode":"400",
   "status":"Bad Request",
   "description":"400 BAD_REQUEST \"O campo document é obrigatório.\""
 }
"""

    Given path 'device-management'
    When method get
    Then status 400
    And match response == responseApi

  @deviceerror3
  Scenario: Validar erro ao enviar application key invalido

    * header X-Application-Key = 'auhdaiuhdaiuhds'
    * header document = document
    Given path 'device-management'
    When method get
    Then status 403

  @deviceerror4
  Scenario: Validar erro ao enviar token inválido

    * header Authorization = 'Bearer aaaaa'
    Given path 'device-management'
    When method get
    Then status 403