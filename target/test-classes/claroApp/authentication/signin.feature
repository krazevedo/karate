Feature: Login no app

  Background:

   * header Content-Type = 'application/json'
   * header x-application-key = xappkey
   * header gw-app-key = gwappkey
   * header Cache-Control = 'no-cache'
   * url authenticationUrl

  @login
  Scenario: Login do usuario

	* def body =
"""
{
    "username": "<username>",
    "password": "<password>"
}
"""

    * replace body.username = username
    * replace body.password = password

    * def responseApi =
"""
{
  userInfo: '#string',
  idmToken: '#string',
  idmSID: '#string'
}
"""
    Given path 'sign-in'
	And request body
	When method post
	Then status 200
	And match response == responseApi
	And def idmToken = response.idmToken
	And def userInfo = response.userInfo
    And def idmSID = response.idmSID

  @error
  Scenario: Login com usuario inválido

	* def body =
"""
{
    "username": "<username>",
    "password": "<password>"
}
"""

    * replace body.username = "user"
    * replace body.password = password

    * def responseApi =
"""
{
    "statusCode":"401",
    "status":"Unauthorized",
    "description":"Usuário e/ou senha inválido(s)"
}
"""
    Given path 'sign-in'
	And request body
	When method post
	Then status 401
	And match response == responseApi

  @error
  Scenario: Login com password inválido

	* def body =
"""
{
    "username": "<username>",
    "password": "<password>"
}
"""

    * replace body.username = username
    * replace body.password = "pass"

    * def responseApi =
"""
{
    "statusCode":"401",
    "status":"Unauthorized",
    "description":"Usuário e/ou senha inválido(s)"
}
"""
    Given path 'sign-in'
	And request body
	When method post
	Then status 401
	And match response == responseApi