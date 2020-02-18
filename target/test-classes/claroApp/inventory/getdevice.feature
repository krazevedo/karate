Feature: Listagem de dispositivos

  Background:

    * def result = callonce read('../../claroApp/authentication/signin.feature@login') { username: 'thiagoflc',  password: 'tfmpif#NET9'}
    * header Authorization = 'Bearer ' + result.idmToken
    * header X-Application-Key = xappkey
    * url inventoryUrl

  @getdevice
  Scenario: Validar lista de dispositivos

    * def responseApi =
"""
[
   {
      "deviceName":"OS X",
      "deviceId":"ZWM6MmM6ZTI6YmM6YTM6MWY%3D",
      "expirationDate":"2020-02-13T23:50:22Z",
      "creationDate":"2019-11-13T23:50:24Z",
      "browserName":"Apple Mail"
   },
   {
      "deviceName":"iOS",
      "deviceId":"NmM6ZTg6NWM6NDA6NTg6OTg%3D",
      "expirationDate":"2020-02-17T14:35:53Z",
      "creationDate":"2019-11-17T14:35:54Z",
      "browserName":"Mobile Safari"
   }
]
"""
    * header document = 'thiagoflc'
    Given path 'device-management'
	When method get
	Then status 200
    And match response == responseApi

  @deviceerror
  Scenario: Validar erro ao enviar documento inválido

    * header document = 'adasdasdasdassdsa'
    Given path 'device-management'
	When method get
	Then status 404

  @deviceerror
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

  @deviceerror
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
    Given path 'device-management'
    When method get
    Then status 403
    And match response == responseApi

  @deviceerror
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
    Given path 'device-management'
    When method get
    Then status 401
    And match response == responseApi