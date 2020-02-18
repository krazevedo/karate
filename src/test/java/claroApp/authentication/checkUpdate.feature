Feature: Checar se precisa atualizar a versão GW-CLARO

  Background:

   * header Content-Type = 'application/json'
   * url authenticationUrl

  @ios
  Scenario: Validar versão atualizada IOS

	* def body =
"""
{
    "platform": "ios",
    "version": "7.1.0"
}
"""

    * def responseApi =
"""
{
  "update": false,
  "link": "itms://itunes.apple.com/in/app/id518321053?mt=8",
  "title": "Atualização necessária!",
  "message": "Você deve atualizar o aplicativo para continuar."
}
"""
    Given path 'check-update'
	And param gw-app-key = gwappkey
	And request body
	When method post
	Then status 200
	And match response == responseApi

  @ios
  Scenario: Validar versão desatualizada IOS

	* def body =
"""
{
    "platform": "ios",
    "version": "6.1.0"
}
"""

    * def responseApi =
"""
{
  "update": true,
  "link": "itms://itunes.apple.com/in/app/id518321053?mt=8",
  "title": "Atualização necessária!",
  "message": "Você deve atualizar o aplicativo para continuar."
}
"""
    Given path 'check-update'
	And param gw-app-key = gwappkey
	And request body
	When method post
	Then status 200
	And match response == responseApi

  @android
  Scenario: Validar versão atualizada Android

	* def body =
"""
{
    "platform": "android",
    "version": "8.4.0"
}
"""

    * def responseApi =
"""
{
  "update": false,
  "link": "https://play.google.com/store/apps/details?id=br.com.net.netapp",
  "title": "Atualização necessária!",
  "message": "Você deve atualizar o aplicativo para continuar."
}
"""
    Given path 'check-update'
	And param gw-app-key = gwappkey
	And request body
	When method post
	Then status 200
	And match response == responseApi

  @android
  Scenario: Validar versão desatualizada Android

	* def body =
"""
{
    "platform": "android",
    "version": "6.4.0"
}
"""

    * def responseApi =
"""
{
  "update": true,
  "link": "https://play.google.com/store/apps/details?id=br.com.net.netapp",
  "title": "Atualização necessária!",
  "message": "Você deve atualizar o aplicativo para continuar."
}
"""
    Given path 'check-update'
	And param gw-app-key = gwappkey
	And request body
	When method post
	Then status 200
	And match response == responseApi

  @error1
  Scenario: Validar json com version em branco

	* def body =
"""
{
    "platform": "ios",
    "version": " "
}
"""

    * def responseApi =
"""
{
  "statusCode": "400",
  "status": "Bad Request",
  "description": "Versão inválida!"
}
"""
    Given path 'check-update'
	And param gw-app-key = gwappkey
	And request body
	When method post
	Then status 400
	And match response == responseApi

  @error2
  Scenario: Validar json com version em branco

	* def body =
"""
{
    "platform": "",
    "version": "7.0.0"
}
"""

    * def responseApi =
"""
{
  "statusCode": "400",
  "status": "Bad Request",
  "description": "Plataforma inválida!"
}
"""
    Given path 'check-update'
	And param gw-app-key = gwappkey
	And request body
	When method post
	Then status 400
	And match response == responseApi

  @error
  Scenario: Validar json em branco

	* def body =
"""
{
    "platform": "",
    "version": ""
}
"""

    * def responseApi =
"""
{
  "statusCode": "400",
  "status": "Bad Request",
  "description": "Plataforma inválida!"
}
"""
    Given path 'check-update'
	And param gw-app-key = gwappkey
	And request body
	When method post
	Then status 400
	And match response == responseApi

  @error
  Scenario: Validar json vazio

	* def body =
"""
{

}
"""

    * def responseApi =
"""
{
  "statusCode": "400",
  "status": "Bad Request",
  "description": "JSON parse error"
}
"""
    Given path 'check-update'
	And param gw-app-key = gwappkey
	And request body
	When method post
	Then status 400
	And match response.statusCode == responseApi.statusCode
	And match response.status == responseApi.status
	And match response.description contains responseApi.description

  @error
  Scenario: Validar key invalida

	* def body =
"""
{
    "platform": "android",
    "version": "6.4.0"
}
"""

    * def responseApi =
"""
{
  "statusCode": 403,
  "error": "Forbidden",
  "message": "Application key is not allowed to call this resource method"
}
"""
    Given path 'check-update'
	And param gw-app-key = 'aaaa'
	And request body
	When method post
	Then status 403
	And match response == responseApi