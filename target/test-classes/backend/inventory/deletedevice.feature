Feature: Remoção de dispositivos

  Background:

    * def result = callonce read('../../claroApp/authentication/signin.feature@login')
    * header Authorization = 'Bearer ' + result.idmToken
    * header X-Application-Key = xappkey
    * url inventoryUrl

  @deletedevice
  Scenario: Validar delete de dispositivos

    * header document = document
    Given path 'device-management/' + deviceId
	When method delete
	Then status 204

  @deleteerror
  Scenario: Validar erro ao enviar deviceId já deletado

    * header document = document
    Given path 'device-management/' + deviceId
    When method delete
    Then status 404

  @deleteerror
  Scenario: Validar erro ao enviar documento inválido

    * header document = 'adasdasdasdassdsa'
    Given path 'device-management/' + deviceId
	When method delete
	Then status 404

  @deleteerror1
  Scenario: Validar erro ao enviar deviceId nulo

    * def responseApi =
"""
{
  "statusCode":"405",
  "status":"Method Not Allowed",
  "description":"Request method 'DELETE' not supported"
}
"""
    * header document = document
    Given path 'device-management/' + ''
    When method delete
    Then status 405
    And match response == responseApi

  @deleteerror
  Scenario: Validar erro ao enviar documento nulo

    * def responseApi =
"""
{
   "statusCode":"400",
   "status":"Bad Request",
   "description":"400 BAD_REQUEST \"O campo document é obrigatório.\""
 }
"""

    Given path 'device-management/' + deviceId
    When method delete
    Then status 400
    And match response == responseApi

  @deleteerror2
  Scenario: Validar erro ao enviar application key invalido

    * def responseApi =
"""
{
  "statusCode":403,
  "error":"Forbidden",
  "message":"Application key is not allowed to call this resource method"
}
"""

    * header X-Application-Key = 'auhdaiuhdaiuhds'
    * header document = document
    Given path 'device-management/' + deviceId
    When method delete
    Then status 403
    And match response == responseApi

  @deleteerror
  Scenario: Validar erro ao enviar token inválido

    * def responseApi =
"""
{
  "statusCode":401,
  "error":"Unauthorized",
  "message":"Bad Response From Token Introspection Endpoint",
  "attributes":{"error":"Bad Response From Token Introspection Endpoint"}
}
"""

    * header Authorization = 'Bearer aaaaa'
    Given path 'device-management/' + deviceId
    When method delete
    Then status 401
    And match response == responseApi