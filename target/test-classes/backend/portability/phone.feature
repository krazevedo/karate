Feature: Portabilidade

  Background:

   * def resultContract = callonce read('../../claroApp/user/contractlist.feature@list')
#   * def result = callonce read('../../claroApp/authentication/signin.feature@login')
   * header Authorization = 'Bearer ' + resultContract.idmtoken + '@' + resultContract.operatorcode + resultContract.contractnumber
   * header X-Application-Key = gwappkey
   * header Content-Type = 'application/json'
   * header origin = 'API'
   * url portabilityUrl

  @phone
  Scenario: Validar criação de portabilidade

    * def body =
"""
{
    "mobileOperatorIdentifier": 81,
    "cellphoneNumber": 11970707171,
    "netPhoneNumber": 11970707172,
    "isHolder": true,
    "clientIP": "192.0.0.1",
    "clientEmail": "teste@teste.com",
    "clientName": "Name Test",
    "requestURI": "a",
    "username": "Tester",
    "cityId": 81
}
"""

    * def responseApi =
"""
{
  protocolNumber: "#string"
}
"""

    Given path 'phone'
    And request body
    When method post
	Then status 200
    And match response == responseApi

  @phoneerror
  Scenario: Validar criação com clientName nulo

    * def body =
"""
{
    "mobileOperatorIdentifier": ,
    "cellphoneNumber": ,
    "netPhoneNumber": ,
    "isHolder": ,
    "clientIP": "",
    "clientEmail": "",
    "clientName": "",
    "requestURI": "",
    "username": "",
    "cityId": 1
}
"""

    * def responseApi =
"""
{
  "statusCode":"400",
  "status":"Bad Request",
  "description":"clientName: Parâmetro ausente ou fora do padrão!"
}
"""

    Given path 'phone'
    And request body
    When method post
    Then status 400
    And match response == responseApi

  @phoneerror
  Scenario: Validar criação com clientEmail nulo

    * def body =
"""
{
    "mobileOperatorIdentifier": ,
    "cellphoneNumber": ,
    "netPhoneNumber": ,
    "isHolder": ,
    "clientIP": "",
    "clientEmail": "",
    "clientName": "Teste Name",
    "requestURI": "",
    "username": "",
    "cityId": 1
}
"""

    * def responseApi =
"""
{
  "statusCode":"400",
  "status":"Bad Request",
  "description":"clientEmail: Parâmetro ausente ou fora do padrão!"
}
"""

    Given path 'phone'
    And request body
    When method post
    Then status 400
    And match response == responseApi

  @phoneerror
  Scenario: Validar criação com netPhoneNumber nulo

    * def body =
"""
{
    "mobileOperatorIdentifier": ,
    "cellphoneNumber": ,
    "netPhoneNumber": ,
    "isHolder": ,
    "clientIP": "",
    "clientEmail": "teste@teste.com",
    "clientName": "Teste Name",
    "requestURI": "",
    "username": "",
    "cityId": 1
}
"""

    * def responseApi =
"""
{
  "statusCode":"400",
  "status":"Bad Request",
  "description":"netPhoneNumber: Parâmetro ausente ou fora do padrão!"
}
"""

    Given path 'phone'
    And request body
    When method post
    Then status 400
    And match response == responseApi

  @phoneerror
  Scenario: Validar criação com mobileOperatorIdentifier nulo

    * def body =
"""
{
    "mobileOperatorIdentifier": ,
    "cellphoneNumber": ,
    "netPhoneNumber": 11910101010,
    "isHolder": ,
    "clientIP": "",
    "clientEmail": "teste@teste.com",
    "clientName": "Teste Name",
    "requestURI": "",
    "username": "",
    "cityId": 1
}
"""

    * def responseApi =
"""
{
  "statusCode":"400",
  "status":"Bad Request",
  "description":"mobileOperatorIdentifier: Parâmetro ausente ou fora do padrão!"
}
"""

    Given path 'phone'
    And request body
    When method post
    Then status 400
    And match response == responseApi

  @phoneerror
  Scenario: Validar criação com clientIP nulo

    * def body =
"""
{
    "mobileOperatorIdentifier": 81,
    "cellphoneNumber": ,
    "netPhoneNumber": 11910101010,
    "isHolder": ,
    "clientIP": "",
    "clientEmail": "teste@teste.com",
    "clientName": "Teste Name",
    "requestURI": "",
    "username": "",
    "cityId": 1
}
"""

    * def responseApi =
"""
{
  "statusCode":"400",
  "status":"Bad Request",
  "description":"clientIP: Parâmetro ausente ou fora do padrão!"
}
"""

    Given path 'phone'
    And request body
    When method post
    Then status 400
    And match response == responseApi

  @phoneerror
  Scenario: Validar criação com isHolder nulo

    * def body =
"""
{
    "mobileOperatorIdentifier": 81,
    "cellphoneNumber": ,
    "netPhoneNumber": 11910101010,
    "isHolder": ,
    "clientIP": "192.0.0.1",
    "clientEmail": "teste@teste.com",
    "clientName": "Teste Name",
    "requestURI": "",
    "username": "",
    "cityId": 1
}
"""

    * def responseApi =
"""
{
  "statusCode":"400",
  "status":"Bad Request",
  "description":"isHolder: Parâmetro ausente ou fora do padrão!"
}
"""

    Given path 'phone'
    And request body
    When method post
    Then status 400
    And match response == responseApi

  @phoneerror
  Scenario: Validar criação com username nulo

    * def body =
"""
{
    "mobileOperatorIdentifier": 81,
    "cellphoneNumber": ,
    "netPhoneNumber": 11910101010,
    "isHolder": true,
    "clientIP": "192.0.0.1",
    "clientEmail": "teste@teste.com",
    "clientName": "Teste Name",
    "requestURI": "",
    "username": "",
    "cityId": 1
}
"""

    * def responseApi =
"""
{
  "statusCode":"400",
  "status":"Bad Request",
  "description":"username: Parâmetro ausente ou fora do padrão!"
}
"""

    Given path 'phone'
    And request body
    When method post
    Then status 400
    And match response == responseApi

  @phoneerror
  Scenario: Validar criação com requestURI nulo

    * def body =
"""
{
    "mobileOperatorIdentifier": 81,
    "cellphoneNumber": ,
    "netPhoneNumber": 11910101010,
    "isHolder": true,
    "clientIP": "192.0.0.1",
    "clientEmail": "teste@teste.com",
    "clientName": "Teste Name",
    "requestURI": "",
    "username": "Tester",
    "cityId": 1
}
"""

    * def responseApi =
"""
{
  "statusCode":"400",
  "status":"Bad Request",
  "description":"requestURI: Parâmetro ausente ou fora do padrão!"
}
"""

    Given path 'phone'
    And request body
    When method post
    Then status 400
    And match response == responseApi

  @phoneerror
  Scenario: Validar criação com cellphoneNumber nulo

    * def body =
"""
{
    "mobileOperatorIdentifier": 81,
    "cellphoneNumber": ,
    "netPhoneNumber": 11910101010,
    "isHolder": true,
    "clientIP": "192.0.0.1",
    "clientEmail": "teste@teste.com",
    "clientName": "Teste Name",
    "requestURI": "a",
    "username": "Tester",
    "cityId": 1
}
"""

    * def responseApi =
"""
{
  "statusCode":"400",
  "status":"Bad Request",
  "description":"cellphoneNumber: Parâmetro ausente ou fora do padrão!"
}
"""

    Given path 'phone'
    And request body
    When method post
    Then status 400
    And match response == responseApi

  @phoneerror
  Scenario: Validar criação com campos a mais

    * def body =
"""
{
  "mobileOperatorIdentifier": 81,
  "cellphoneNumber": 11990101010,
  "netPhoneNumber": 11910101010,
  "isHolder": true,
  "clientIP": "192.0.0.1",
  "clientEmail": "teste@teste.com",
  "clientName": "Teste Name",
  "clientAddress": "Rua rua",
  "clientPostalCode": "13333-111",
  "clientNeighborhood": "",
  "clientState": "SP",
  "clientCity": "São Paulo",
  "requestURI": "a",
  "username": "Teste",
  "cityId": 81
}
"""

    * def responseApi =
"""
{
  "statusCode":"400",
  "status":"Bad Request",
  "description":"cellphoneNumber: Parâmetro ausente ou fora do padrão!"
}
"""

    Given path 'phone'
    And request body
    When method post
    Then status 400
    And match response == responseApi

  @phoneerror
  Scenario: Validar criação com campos nulos

    * def body =
"""
{
    "mobileOperatorIdentifier": 81,
    "cellphoneNumber": 11990101010,
    "netPhoneNumber": 11910101010,
    "isHolder": true,
    "clientIP": "192.0.0.1",
    "clientEmail": "teste@teste.com",
    "clientName": "Teste Name",
    "requestURI": "a",
    "username": "Tester"
}
"""

    * def responseApi =
"""
{
  "statusCode":"400",
  "status":"Bad Request",
  "description":"cityId: Parâmetro ausente ou fora do padrão!"
}
"""

    Given path 'phone'
    And request body
    When method post
    Then status 400
    And match response == responseApi

  @phoneerror
  Scenario: Validar criação com campos limite máximo

    * def body =
"""
{
    "mobileOperatorIdentifier": 81,
    "cellphoneNumber": 11970707171,
    "netPhoneNumber": 11970707172,
    "isHolder": true,
    "clientIP": "192.0.0.1",
    "clientEmail": "teste@teste.com",
    "clientName": "Name Test",
    "requestURI": "a",
    "username": "Tester",
    "cityId": "aaa"
}
"""

    * def responseApi =
"""
{
  "statusCode":"400",
  "status":"Bad Request",
  "description":"cityId: Parâmetro ausente ou fora do padrão!"
}
"""

    Given path 'phone'
    And request body
    When method post
    Then status 400
    And match response == responseApi

  @phoneerror
  Scenario: Validar criação com campos limite máximo

    * def body =
"""
{
    "mobileOperatorIdentifier": 8888881,
    "cellphoneNumber": 119988888888888880101010,
    "netPhoneNumber": 1191088888888888888101010,
    "isHolder": true,
    "clientIP": "192.0.0.1",
    "clientEmail": "tesaudshiudashisdauhdsahudsahdsahduasiuadhdasuaduadudauadshdashdsahdsaudsahudahusdhadahiiadhaiuuate@teste.com",
    "clientName": "Teste Nameudsaiudsaudsaudsau hdiu dhasiuadhudah uddhu dashsa iudh udash idauh iudsah dush idsau dsauh idsauh dasuhudsh auih iudsah idash",
    "requestURI": "auidahsiusadhiudsh idhsi usahiudashudsh iuadhs iudahs iuash iusda iudsahiu ds iuadhs iudhs iuads iuhdsi sdiuhd isuh isudhiasud sah",
    "username": "Tester dasihsdaiuh sadiuh dsahius huds usdhaiu dashudsha usadh uadhs iuadhs iudahs iudsa iudash idsah isahdsda huiadsh iuadsh idsahadhs dsah ",
    "cityId": 1
}
"""

    * def responseApi =
"""
{
  "statusCode":"400",
  "status":"Bad Request",
  "description":"cityId: Parâmetro ausente ou fora do padrão!"
}
"""

    Given path 'phone'
    And request body
    When method post
    Then status 400
    And match response == responseApi

  @phoneerror1
  Scenario: Validar criação com cityId limite máximo

    * def body =
"""
{
    "mobileOperatorIdentifier": 81,
    "cellphoneNumber": 11970707171,
    "netPhoneNumber": 11970707172,
    "isHolder": true,
    "clientIP": "192.0.0.1",
    "clientEmail": "teste@teste.com",
    "clientName": "Name Test",
    "requestURI": "a",
    "username": "Tester",
    "cityId": 9999999999999999999999999999
}
"""

    * def responseApi =
"""
{
  "statusCode":"400",
  "status":"Bad Request",
  "description":"cityId: Parâmetro ausente ou fora do padrão!"
}
"""

    Given path 'phone'
    And request body
    When method post
    Then status 400
    And match response == responseApi

  @phoneerror
  Scenario: Validar criação com application key inválido

    * def body =
"""
{
    "mobileOperatorIdentifier": 81,
    "cellphoneNumber": 11970707171,
    "netPhoneNumber": 11970707172,
    "isHolder": true,
    "clientIP": "192.0.0.1",
    "clientEmail": "teste@teste.com",
    "clientName": "Name Test",
    "requestURI": "a",
    "username": "Tester",
    "cityId": 1
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

    * header X-Application-Key = 'gwappkey'
    Given path 'phone'
    And request body
    When method post
    Then status 403
    And match response == responseApi

  @phoneerror
  Scenario: Validar criação com authorization inválido

    * def body =
"""
{
    "mobileOperatorIdentifier": 81,
    "cellphoneNumber": 11970707171,
    "netPhoneNumber": 11970707172,
    "isHolder": true,
    "clientIP": "192.0.0.1",
    "clientEmail": "teste@teste.com",
    "clientName": "Name Test",
    "requestURI": "a",
    "username": "Tester",
    "cityId": 1
}
"""

    * def responseApi =
"""
{
  "statusCode":401,
  "error":"Unauthorized",
  "message":"Bad Response From Token Introspection Endpoint","attributes":{"error":"Bad Response From Token Introspection Endpoint"}
}
"""

    * header Authorization = 'Bearer ' + result.idmToken + '@' + '003'
    Given path 'phone'
    And request body
    When method post
    Then status 401
    And match response == responseApi

  @phoneerror
  Scenario: Validar criação passando método put

    * def body =
"""
{
    "mobileOperatorIdentifier": 81,
    "cellphoneNumber": 11970707171,
    "netPhoneNumber": 11970707172,
    "isHolder": true,
    "clientIP": "192.0.0.1",
    "clientEmail": "teste@teste.com",
    "clientName": "Name Test",
    "requestURI": "a",
    "username": "Tester",
    "cityId": 1
}
"""

    * def responseApi =
"""
{
  "statusCode":405,
  "error":"Method Not Allowed",
  "message":"Resource Method not found"
}
"""

    Given path 'phone'
    And request body
    When method put
    Then status 405
    And match response == responseApi

  @phoneerror
  Scenario: Validar criação passando método delete

    * def body =
"""
{
    "mobileOperatorIdentifier": 81,
    "cellphoneNumber": 11970707171,
    "netPhoneNumber": 11970707172,
    "isHolder": true,
    "clientIP": "192.0.0.1",
    "clientEmail": "teste@teste.com",
    "clientName": "Name Test",
    "requestURI": "a",
    "username": "Tester",
    "cityId": 1
}
"""

    * def responseApi =
"""
{
  "statusCode":405,
  "error":"Method Not Allowed",
  "message":"Resource Method not found"
}
"""

    Given path 'phone'
    And request body
    When method delete
    Then status 405
    And match response == responseApi

  @phoneerror2
  Scenario: Validar criação passando método get

    * def responseApi =
"""
{
  "statusCode":405,
  "error":"Method Not Allowed",
  "message":"Resource Method not found"
}
"""

    Given path 'phone'
    When method get
    Then status 405
    And match response == responseApi