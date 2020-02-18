Feature: Portabilidade

  Background:

   * def result = callonce read('../../claroApp/authentication/signin.feature@login') { username: 'Net.web', password: 'Net.123' }
   * header Authorization = 'Bearer ' + result.idmToken + '@' + '003' + '349338695'
   * header X-Application-Key = gwappkey
   * header Content-Type = 'application/json'
   * header origin = 'API'
   * url portabilityUrl

  @phone-address
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
  "clientAddress": "Rua Teste",
  "clientPostalCode": "13000000",
  "clientNeighborhood": "Bairro Teste",
  "clientState": "SP",
  "clientCity": "São Paulo",
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

    Given path 'phone-address'
    And request body
    When method post
	Then status 200
    And match response == responseApi

  @phone-addresserror
  Scenario: Validar criação com campos nulos

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
  "clientAddress": "",
  "clientPostalCode": "",
  "clientNeighborhood": "",
  "clientState": "",
  "clientCity": "",
  "requestURI": "",
  "username": "",
  "cityId": 81
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

    Given path 'phone-address'
    And request body
    When method post
    Then status 400
    And match response == responseApi

  @phone-addresserror
  Scenario: Validar criação com campos nulos

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
  "clientAddress": "",
  "clientPostalCode": "",
  "clientNeighborhood": "",
  "clientState": "",
  "clientCity": "",
  "requestURI": "a",
  "username": "",
  "cityId": 81
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

    Given path 'phone-address'
    And request body
    When method post
    Then status 400
    And match response == responseApi

  @phone-addresserror
  Scenario: Validar criação com campos nulos

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
  "clientAddress": "",
  "clientPostalCode": "",
  "clientNeighborhood": "",
  "clientState": "",
  "clientCity": "",
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
  "description":"isHolder: Parâmetro ausente ou fora do padrão!"
}
"""

    Given path 'phone-address'
    And request body
    When method post
    Then status 400
    And match response == responseApi

  @phone-addresserror
  Scenario: Validar criação com campos nulos

    * def body =
"""
{
  "mobileOperatorIdentifier": ,
  "cellphoneNumber": ,
  "netPhoneNumber": ,
  "isHolder": true,
  "clientIP": "",
  "clientEmail": "",
  "clientName": "",
  "clientAddress": "",
  "clientPostalCode": "",
  "clientNeighborhood": "",
  "clientState": "",
  "clientCity": "",
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
  "description":"clientState: Parâmetro ausente ou fora do padrão!"
}
"""

    Given path 'phone-address'
    And request body
    When method post
    Then status 400
    And match response == responseApi

  @phone-addresserror
  Scenario: Validar criação com campos nulos

    * def body =
"""
{
  "mobileOperatorIdentifier": ,
  "cellphoneNumber": ,
  "netPhoneNumber": ,
  "isHolder": true,
  "clientIP": "",
  "clientEmail": "",
  "clientName": "",
  "clientAddress": "",
  "clientPostalCode": "",
  "clientNeighborhood": "",
  "clientState": "SP",
  "clientCity": "",
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
  "description":"netPhoneNumber: Parâmetro ausente ou fora do padrão!"
}
"""

    Given path 'phone-address'
    And request body
    When method post
    Then status 400
    And match response == responseApi

  @phone-addresserror
  Scenario: Validar criação com campos nulos

    * def body =
"""
{
  "mobileOperatorIdentifier": ,
  "cellphoneNumber": ,
  "netPhoneNumber": 11910101010,
  "isHolder": true,
  "clientIP": "",
  "clientEmail": "",
  "clientName": "",
  "clientAddress": "",
  "clientPostalCode": "",
  "clientNeighborhood": "",
  "clientState": "SP",
  "clientCity": "",
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
  "description":"mobileOperatorIdentifier: Parâmetro ausente ou fora do padrão!"
}
"""

    Given path 'phone-address'
    And request body
    When method post
    Then status 400
    And match response == responseApi

  @phone-addresserror
  Scenario: Validar criação com campos nulos

    * def body =
"""
{
  "mobileOperatorIdentifier": 81,
  "cellphoneNumber": ,
  "netPhoneNumber": 11910101010,
  "isHolder": true,
  "clientIP": "",
  "clientEmail": "",
  "clientName": "",
  "clientAddress": "",
  "clientPostalCode": "",
  "clientNeighborhood": "",
  "clientState": "SP",
  "clientCity": "",
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
  "description":"clientIP: Parâmetro ausente ou fora do padrão!"
}
"""

    Given path 'phone-address'
    And request body
    When method post
    Then status 400
    And match response == responseApi

  @phone-addresserror
  Scenario: Validar criação com campos nulos

    * def body =
"""
{
  "mobileOperatorIdentifier": 81,
  "cellphoneNumber": ,
  "netPhoneNumber": 11910101010,
  "isHolder": true,
  "clientIP": "192.0.0.1",
  "clientEmail": "",
  "clientName": "",
  "clientAddress": "",
  "clientPostalCode": "",
  "clientNeighborhood": "",
  "clientState": "SP",
  "clientCity": "",
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
  "description":"clientPostalCode: Parâmetro ausente ou fora do padrão!"
}
"""

    Given path 'phone-address'
    And request body
    When method post
    Then status 400
    And match response == responseApi

  @phone-addresserror
  Scenario: Validar criação com campos nulos

    * def body =
"""
{
  "mobileOperatorIdentifier": 81,
  "cellphoneNumber": ,
  "netPhoneNumber": 11910101010,
  "isHolder": true,
  "clientIP": "192.0.0.1",
  "clientEmail": "",
  "clientName": "",
  "clientAddress": "",
  "clientPostalCode": "13333-111",
  "clientNeighborhood": "",
  "clientState": "SP",
  "clientCity": "",
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

    Given path 'phone-address'
    And request body
    When method post
    Then status 400
    And match response == responseApi

  @phone-addresserror
  Scenario: Validar criação com campos nulos

    * def body =
"""
{
  "mobileOperatorIdentifier": 81,
  "cellphoneNumber": 11990101010,
  "netPhoneNumber": 11910101010,
  "isHolder": true,
  "clientIP": "192.0.0.1",
  "clientEmail": "",
  "clientName": "",
  "clientAddress": "",
  "clientPostalCode": "13333-111",
  "clientNeighborhood": "",
  "clientState": "SP",
  "clientCity": "",
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
  "description":"clientAddress: Parâmetro ausente ou fora do padrão!"
}
"""

    Given path 'phone-address'
    And request body
    When method post
    Then status 400
    And match response == responseApi

  @phone-addresserror
  Scenario: Validar criação com campos nulos

    * def body =
"""
{
  "mobileOperatorIdentifier": 81,
  "cellphoneNumber": 11990101010,
  "netPhoneNumber": 11910101010,
  "isHolder": true,
  "clientIP": "192.0.0.1",
  "clientEmail": "",
  "clientName": "",
  "clientAddress": "Rua rua",
  "clientPostalCode": "13333-111",
  "clientNeighborhood": "",
  "clientState": "SP",
  "clientCity": "",
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
  "description":"clientCity: Parâmetro ausente ou fora do padrão!"
}
"""

    Given path 'phone-address'
    And request body
    When method post
    Then status 400
    And match response == responseApi

  @phone-addresserror
  Scenario: Validar criação com campos nulos

    * def body =
"""
{
  "mobileOperatorIdentifier": 81,
  "cellphoneNumber": 11990101010,
  "netPhoneNumber": 11910101010,
  "isHolder": true,
  "clientIP": "192.0.0.1",
  "clientEmail": "",
  "clientName": "",
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
  "description":"clientName: Parâmetro ausente ou fora do padrão!"
}
"""

    Given path 'phone-address'
    And request body
    When method post
    Then status 400
    And match response == responseApi

  @phone-addresserror
  Scenario: Validar criação com campos nulos

    * def body =
"""
{
  "mobileOperatorIdentifier": 81,
  "cellphoneNumber": 11990101010,
  "netPhoneNumber": 11910101010,
  "isHolder": true,
  "clientIP": "192.0.0.1",
  "clientEmail": "",
  "clientName": "",
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
  "description":"clientName: Parâmetro ausente ou fora do padrão!"
}
"""

    Given path 'phone-address'
    And request body
    When method post
    Then status 400
    And match response == responseApi

  @phone-addresserror
  Scenario: Validar criação com campos nulos

    * def body =
"""
{
  "mobileOperatorIdentifier": 81,
  "cellphoneNumber": 11990101010,
  "netPhoneNumber": 11910101010,
  "isHolder": true,
  "clientIP": "192.0.0.1",
  "clientEmail": "",
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
  "description":"clientEmail: Parâmetro ausente ou fora do padrão!"
}
"""

    Given path 'phone-address'
    And request body
    When method post
    Then status 400
    And match response == responseApi

  @phone-addresserror
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
  "description":"clientNeighborhood: Parâmetro ausente ou fora do padrão!"
}
"""

    Given path 'phone-address'
    And request body
    When method post
    Then status 400
    And match response == responseApi

  @phone-addresserror
  Scenario: Validar criação com string no campo de cityId

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
  "clientNeighborhood": "Bairro",
  "clientState": "SP",
  "clientCity": "São Paulo",
  "requestURI": "a",
  "username": "Teste",
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

    Given path 'phone-address'
    And request body
    When method post
    Then status 400
    And match response == responseApi

  @phone-addresserror
  Scenario: Validar criação com valor máximo no campo de cityId

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
  "clientNeighborhood": "Bairro",
  "clientState": "SP",
  "clientCity": "São Paulo",
  "requestURI": "a",
  "username": "Teste",
  "cityId": 821212121212122122121212121212111
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

    Given path 'phone-address'
    And request body
    When method post
    Then status 400
    And match response == responseApi

  @phone-addresserror
  Scenario: Validar criação com valores máximos nos campos

    * def body =
"""
{
  "mobileOperatorIdentifier": 81,
  "cellphoneNumber": 11990122121212121212101010,
  "netPhoneNumber": 11910212121212121101010,
  "isHolder": true,
  "clientIP": "192.0.0.1212121212121212121",
  "clientEmail": "testesdhsauihihaiudhsauihsauhiusahiusahdiushdiuhsaiuhsdaiu@teste.com",
  "clientName": "Teste Namediuahiuadh usdh iuashiusad iusah iuhsadu hsaudihsai hisau idsah aiushd idsha siuahiusahiusahiuashiusahiusah",
  "clientAddress": "Rua ruaTeste Namediuahiuadh usdh iuashiusad iusah iuhsadu hsaudihsai hisau idsah aiushd idsha siuahiusahiusahiuashiusahiusah",
  "clientPostalCode": "13333-111",
  "clientNeighborhood": "BairroTeste Namediuahiuadh usdh iuashiusad iusah iuhsadu hsaudihsai hisau idsah aiushd idsha siuahiusahiusahiuashiusahiusah",
  "clientState": "SPTeste Namediuahiuadh usdh iuashiusad iusah iuhsadu hsaudihsai hisau idsah aiushd idsha siuahiusahiusahiuashiusahiusah",
  "clientCity": "São PauloTeste Namediuahiuadh usdh iuashiusad iusah iuhsadu hsaudihsai hisau idsah aiushd idsha siuahiusahiusahiuashiusahiusah",
  "requestURI": "aTeste Namediuahiuadh usdh iuashiusad iusah iuhsadu hsaudihsai hisau idsah aiushd idsha siuahiusahiusahiuashiusahiusah",
  "username": "TesteTeste Namediuahiuadh usdh iuashiusad iusah iuhsadu hsaudihsai hisau idsah aiushd idsha siuahiusahiusahiuashiusahiusah",
  "cityId": 81
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

    Given path 'phone-address'
    And request body
    When method post
    Then status 400
    And match response == responseApi


  @phone-addresserror
  Scenario: Validar criação com application key inválido

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
  "clientNeighborhood": "Bairro",
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
  "statusCode":403,
  "error":"Forbidden",
  "message":"Application key is not allowed to call this resource method"
}
"""

    * header X-Application-Key = 'gwappkey'
    Given path 'phone-address'
    And request body
    When method post
    Then status 403
    And match response == responseApi

  @phone-addresserror
  Scenario: Validar criação com authorization inválido

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
  "clientNeighborhood": "Bairro",
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
  "statusCode":401,
  "error":"Unauthorized",
  "message":"Bad Response From Token Introspection Endpoint","attributes":{"error":"Bad Response From Token Introspection Endpoint"}
}
"""

    * header Authorization = 'Bearer ' + result.idmToken + '@' + '003'
    Given path 'phone-address'
    And request body
    When method post
    Then status 401
    And match response == responseApi