@all
Feature: Geração do WCP token

  Background:

   * url securityUrl
   * def resultContract = callonce read('../../claroApp/user/contractlist.feature@list')
   * def decodejwt =
        """
        function(token) {
            var cl = Java.type('backend.DecodeJWT');
            var ff = new cl();
            return [ff.getContract(token), ff.getOperatorCode(token), ff.getPartner(token)];
        }
        """

  @smstoken
  Scenario: Validar token de usuários SMS


    * def responseApi =
"""
{
    token:'#string'
}
"""
    * headers { contract-number: '#(resultContract.contractnumber)', operator-code: '#(resultContract.operatorcode)', partner-account: '#(partneraccount)', user-info: '#(resultContract.userinfo)', x-application-key: '#(xappkey)' }
    Given path 'generate-token-by-userinfo/sms'
	And request {}
	When method get
	Then status 200
	And match response == responseApi
	And def wcp = response.token
	And match contractnumber == decodejwt(wcp)[0]
	And match operatorcode == decodejwt(wcp)[1]
	And match partneraccount == decodejwt(wcp)[2]


  @smserro
  Scenario: Validar token de usuários SMS com contract number inválido

    * def responseApi =
"""
{
    "statusCode":"404",
    "status":"Not Found",
    "description":"Dados Não encontrados."
}
"""
    * headers { contract-number: '1', operator-code: '#(operatorcode)', partner-account: '#(partneraccount)', user-info: '#(resultContract.userinfo)', x-application-key: '#(gwappkey)' }
    Given path 'generate-token-by-userinfo/sms'
	And request {}
	When method get
	Then status 404
	And match response == responseApi

  @smserro
  Scenario: Validar token de usuários SMS sem contract number

    * def responseApi =
"""
{
    "statusCode":"400",
    "status":"Bad Request",
    "description":"Missing request header 'contract-number' for method parameter of type String"
}
"""
    * headers {operator-code: '#(operatorcode)', partner-account: '#(partneraccount)', user-info: '#(resultContract.userinfo)', x-application-key: '#(gwappkey)' }
    Given path 'generate-token-by-userinfo/sms'
	And request {}
	When method get
	Then status 400
	And match response == responseApi

  @smserro
  Scenario: Validar token de usuários SMS com operator code inválido

    * def responseApi =
"""
{
    "statusCode":"404",
    "status":"Not Found",
    "description":"Dados Não encontrados."
}
"""
    * headers { contract-number: '#(contractnumber)', operator-code: '100', partner-account: '#(partneraccount)', user-info: '#(resultContract.userinfo)', x-application-key: '#(gwappkey)' }
    Given path 'generate-token-by-userinfo/sms'
	And request {}
	When method get
	Then status 404
	And match response == responseApi

  @smserro
  Scenario: Validar token de usuários SMS sem operator code

    * def responseApi =
"""
{
    "statusCode":"400",
    "status":"Bad Request",
    "description":"Missing request header 'operator-code' for method parameter of type String"
}
"""
    * headers { contract-number: '#(contractnumber)', partner-account: '#(partneraccount)', user-info: '#(resultContract.userinfo)', x-application-key: '#(gwappkey)' }
    Given path 'generate-token-by-userinfo/sms'
	And request {}
	When method get
	Then status 400
	And match response == responseApi

  @smserro
  Scenario: Validar token de usuários SMS com partner account inválido

    * def responseApi =
"""
{
    "statusCode":"401",
    "status":"Unauthorized",
    "description":"PartnerAccount not found or out of pattern"
}
"""
    * headers { contract-number: '#(contractnumber)', operator-code: '#(operatorcode)', partner-account: '1', user-info: '#(resultContract.userinfo)', x-application-key: '#(gwappkey)' }
    Given path 'generate-token-by-userinfo/sms'
	And request {}
	When method get
	Then status 401
	And match response == responseApi

  @smserro
  Scenario: Validar token de usuários SMS sem partner account

    * def responseApi =
"""
{
    "statusCode":"400",
    "status":"Bad Request",
    "description":"Missing request header 'partner-account' for method parameter of type String"
}
"""
    * headers { contract-number: '#(contractnumber)', operator-code: '#(operatorcode)', user-info: '#(resultContract.userinfo)', x-application-key: '#(gwappkey)' }
    Given path 'generate-token-by-userinfo/sms'
	And request {}
	When method get
	Then status 400
	And match response == responseApi

  @smserro
  Scenario: Validar token de usuários SMS com user info inválido

    * def responseApi =
"""
{
    "statusCode":"500",
    "status":"Internal Server Error",
    "description":"Last encoded character (before the paddings if any) is a valid base 64 alphabet but not a possible value"
}
"""
    * headers { contract-number: '#(contractnumber)', operator-code: '#(operatorcode)', partner-account: '#(partneraccount)', user-info: 'aaa', x-application-key: '#(gwappkey)' }
    Given path 'generate-token-by-userinfo/sms'
	And request {}
	When method get
	Then status 500
	And match response == responseApi

  @smserro
  Scenario: Validar token de usuários SMS com user info de outro usuário

    * def responseApi =
"""
{
    "statusCode":"401",
    "status":"Unauthorized",
    "description":"Credenciais Inválidas"
}
"""
    * headers { contract-number: '#(contractnumber)', operator-code: '#(operatorcode)', partner-account: '#(partneraccount)', user-info: '#(userinfouno)', x-application-key: '#(gwappkey)' }
    Given path 'generate-token-by-userinfo/sms'
	And request {}
	When method get
	Then status 401
	And match response == responseApi

  @smserro
  Scenario: Validar token de usuários SMS sem user info

    * def responseApi =
"""
{
    "statusCode":"400",
    "status":"Bad Request",
    "description":"Missing request header 'user-info' for method parameter of type String"
}
"""
    * headers { contract-number: '#(contractnumber)', operator-code: '#(operatorcode)', partner-account: '#(partneraccount)', x-application-key: '#(gwappkey)' }
    Given path 'generate-token-by-userinfo/sms'
	And request {}
	When method get
	Then status 400
	And match response == responseApi

  @smserro
  Scenario: Validar token de usuários SMS com application key inválido

    * def responseApi =
"""
{
    "statusCode":403,
    "error":"Forbidden",
    "message":"Application key is not allowed to call this resource method"
}
"""
    * headers { contract-number: '#(contractnumber)', operator-code: '#(operatorcode)', partner-account: '#(partneraccount)', user-info: '#(resultContract.userinfo)', x-application-key: 'aaa' }
    Given path 'generate-token-by-userinfo/sms'
	And request {}
	When method get
	Then status 403
	And match response == responseApi

  @smserro
  Scenario: Validar token de usuários SMS sem application key

    * def responseApi =
"""
{
    "statusCode": 400,
    "error": "Bad Request",
    "message": "A key must be provided by request header \"X-Application-Key\" or \"X-Developer-Application-Key\" or queryString parameters \"gw-app-key\" or \"gw-dev-app-key\""
}
"""
    * headers { contract-number: '#(contractnumber)', operator-code: '#(operatorcode)', partner-account: '#(partneraccount)', user-info: '#(resultContract.userinfo)'}
    Given path 'generate-token-by-userinfo/sms'
	And request {}
	When method get
	Then status 400
	And match response == responseApi


  @unotoken
  Scenario: Validar token de usuários UNO

    * def responseApi =
"""
{
    token:'#string'
}
"""


    * headers { contract-number: '#(contractnumberuno)', partner-account: '#(partneraccount)', user-info: '#(userinfouno)', x-application-key: '#(gwappkey)' }
    Given path 'generate-token-by-userinfo/uno'
	And request {}
	When method get
	Then status 200
	And match response == responseApi
	And def wcp = response.token
    And match contractnumberuno == decodejwt(wcp)[0]
    And match partneraccount == decodejwt(wcp)[2]

  @unoerro
  Scenario: Validar token de usuários UNO com contract number inválido

    * def responseApi =
"""
{
    "statusCode":"404",
    "status":"Not Found",
    "description":"Dados não encontrados"
}
"""

    * headers { contract-number: '#(contractnumber)', partner-account: '#(partneraccount)', user-info: '#(userinfouno)', x-application-key: '#(gwappkey)' }
    Given path 'generate-token-by-userinfo/uno'
	And request {}
	When method get
	Then status 404
	And match response == responseApi

  @unoerro
  Scenario: Validar token de usuários UNO sem contract number

    * def responseApi =
"""
{
    "statusCode":"400",
    "status":"Bad Request",
    "description":"Missing request header 'contract-number' for method parameter of type String"
}
"""

    * headers { partner-account: '#(partneraccount)', user-info: '#(userinfouno)', x-application-key: '#(gwappkey)' }
    Given path 'generate-token-by-userinfo/uno'
	And request {}
	When method get
	Then status 400
	And match response == responseApi

  @unoerro
  Scenario: Validar token de usuários UNO com partner account inválido

    * def responseApi =
"""
{
    "statusCode":"401",
    "status":"Unauthorized",
    "description":"PartnerAccount not found or out of pattern"
}
"""

    * headers { contract-number: '#(contractnumberuno)', partner-account: '111', user-info: '#(userinfouno)', x-application-key: '#(gwappkey)' }
    Given path 'generate-token-by-userinfo/uno'
	And request {}
	When method get
	Then status 401
	And match response == responseApi

  @unoerro
  Scenario: Validar token de usuários UNO sem partner account

    * def responseApi =
"""
{
    "statusCode":"400",
    "status":"Bad Request",
    "description":"Missing request header 'partner-account' for method parameter of type String"
}
"""

    * headers { contract-number: '#(contractnumberuno)', user-info: '#(userinfouno)', x-application-key: '#(gwappkey)' }
    Given path 'generate-token-by-userinfo/uno'
	And request {}
	When method get
	Then status 400
	And match response == responseApi

  @unoerro
  Scenario: Validar token de usuários UNO com user info inválido

    * def responseApi =
"""
{
    "statusCode":"500",
    "status":"Internal Server Error",
    "description":"Input length must be multiple of 16 when decrypting with padded cipher"
}
"""

    * headers { contract-number: '#(contractnumberuno)', partner-account: '#(partneraccount)', user-info: '111', x-application-key: '#(gwappkey)' }
    Given path 'generate-token-by-userinfo/uno'
	And request {}
	When method get
	Then status 500
	And match response == responseApi

  @unoerro
  Scenario: Validar token de usuários UNO sem user info

    * def responseApi =
"""
{
    "statusCode":"400",
    "status":"Bad Request",
    "description":"Missing request header 'user-info' for method parameter of type String"
}
"""

    * headers { contract-number: '#(contractnumberuno)', partner-account: '#(partneraccount)', x-application-key: '#(gwappkey)' }
    Given path 'generate-token-by-userinfo/uno'
	And request {}
	When method get
	Then status 400
	And match response == responseApi

  @unoerro
  Scenario: Validar token de usuários UNO com application key inválido

    * def responseApi =
"""
{
    "statusCode":403,
    "error":"Forbidden",
    "message":"Application key is not allowed to call this resource method"
}
"""

    * headers { contract-number: '#(contractnumberuno)', partner-account: '#(partneraccount)', user-info: '#(userinfouno)', x-application-key: '111' }
    Given path 'generate-token-by-userinfo/uno'
	And request {}
	When method get
	Then status 403
	And match response == responseApi

  @unoerro
  Scenario: Validar token de usuários UNO sem partner account

    * def responseApi =
"""
{
    "statusCode": 400,
    "error": "Bad Request",
    "message": "A key must be provided by request header \"X-Application-Key\" or \"X-Developer-Application-Key\" or queryString parameters \"gw-app-key\" or \"gw-dev-app-key\""
}
"""

    * headers { contract-number: '#(contractnumberuno)', partner-account: '#(partneraccount)', user-info: '#(userinfouno)' }
    Given path 'generate-token-by-userinfo/uno'
	And request {}
	When method get
	Then status 400
	And match response == responseApi

  @unogenerico
  Scenario: Validar token de usuários UNO acessando endpoint genérico

    * def responseApi =
"""
{
    token:'#string'
}
"""

     * headers { contract-number: '#(contractnumberuno)', operator-code: '#(contractnumberuno.substring(0,3))', partner-account: '#(partneraccount)', user-info: '#(userinfouno)', x-application-key: '#(gwappkey)' }
    Given path 'generate-token-by-userinfo'
	And request {}
	When method get
	Then status 200
	And match response == responseApi
	And def wcp = response.token

  @smsgenerico
  Scenario: Validar token de usuários SMS acessando endpoint genérico

    * def responseApi =
"""
{
    token:'#string'
}
"""

    * headers { contract-number: '#(contractnumber)', operator-code: '#(operatorcode)', partner-account: '#(partneraccount)', user-info: '#(resultContract.userinfo)', x-application-key: '#(gwappkey)' }
    Given path 'generate-token-by-userinfo'
	And request {}
	When method get
	Then status 200
	And match response == responseApi
	And def wcp = response.token