Feature: Edição de dispositivos

  Background:

    * def result = callonce read('../../claroApp/authentication/signin.feature@login')
    * header Authorization = 'Bearer ' + result.idmToken
    * header X-Application-Key = xappkey
    * header Content-type = 'application/json'
    * url inventoryUrl

  @putdevice
  Scenario: Validar edição de dispositivo

    * def body =
"""
{
  "deviceId": "MDA6MDU6MTY6NTk6ZjE6NjM%3D",
  "deviceName": "Windows"
}
"""

    * header document = document
    Given path 'device-management'
    And request body
	When method put
	Then status 204

  @deviceerror
  Scenario: Validar erro ao enviar documento inválido

    * def body =
"""
{
  "deviceId": "MDA6MDU6MTY6NTk6ZjE6NjM%3D",
  "deviceName": "Windows"
}
"""

    * header document = 'suhisauhdiduhiaudsh'
    Given path 'device-management'
    And request body
    When method put
	Then status 404

  @deviceerror
  Scenario: Validar erro ao enviar documento nulo

    * def body =
"""
{
  "deviceId": "MDA6MDU6MTY6NTk6ZjE6NjM%3D",
  "deviceName": "Windows"
}
"""
    * def responseApi =
"""
{
   "statusCode":"400",
   "status":"Bad Request",
   "description":"400 BAD_REQUEST \"O campo document é obrigatório.\""
 }
"""
    Given path 'device-management'
    And request body
    When method put
    Then status 400
    And match response == responseApi

  @deviceerror
  Scenario: Validar erro ao enviar application key invalido

    * def body =
"""
{
  "deviceId": "MDA6MDU6MTY6NTk6ZjE6NjM%3D",
  "deviceName": "Windows"
}
"""
    * def responseApi =
"""
{
  "statusCode":403,
  "error":"Forbidden",
  "message":"Application key is not allowed to call this resource method"
}
"""

    * header document = document
    * header X-Application-Key = 'suhdsauhiuasduahsiuh'
    Given path 'device-management'
    And request body
    When method put
    Then status 403
    And match response == responseApi

  @deviceerror
  Scenario: Validar erro ao enviar token inválido

    * def body =
"""
{
  "deviceId": "MDA6MDU6MTY6NTk6ZjE6NjM%3D",
  "deviceName": "Windows"
}
"""
    * def responseApi =
"""
{
  "statusCode":401,
  "error":"Unauthorized",
  "message":"Bad Response From Token Introspection Endpoint",
  "attributes":{"error":"Bad Response From Token Introspection Endpoint"}
}
"""
    * header document = document
    * header Authorization = 'Bearer aaaa'
    Given path 'device-management'
    And request body
    When method put
    Then status 401
    And match response == responseApi