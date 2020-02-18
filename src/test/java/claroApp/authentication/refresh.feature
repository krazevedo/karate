Feature: Atualizar token

  Background:

   * def token = callonce read('../authentication/signin.feature@login')
   * def idmtoken = token.idmToken
   * header Content-Type = 'application/json'
   * header x-application-key = gwappkey
   * header gw-app-key = gwappkey
   * url authenticationUrl

  @refresh
  Scenario: Validar atualização do token

     * def body =
  """
  {
      "token": "<idmtoken>"
  }
  """

    * def responseApi =
"""
{
    token:'#string'
}
"""
    * replace body.idmtoken = idmtoken

    Given path 'refresh'
	And request body
	When method put
	Then status 200
	And match response == responseApi