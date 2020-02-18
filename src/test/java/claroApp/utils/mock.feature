Feature: Mock para decriptar a credencial do usuario


  Background:

   * def result = callonce read('../../user/usercredential/usercredential.feature@credencial')
   * def credential = result.result
   * header Content-Type = 'application/json'
   * header Cache-Control = 'no-cache'

  Scenario: Decriptar a credencial do usuario

    * def body =
"""
{
  "value": "<usercredential>",
  "key": "<key>"
}
"""
    * replace body.usercredential = credential
    * replace body.key = partneraccountkey

    Given url 'http://minha-net-228112.appspot.com/net/decrypt?='
    And request body
    When method post
    Then status 200
    And def username = response.username
    And def name = response.name
    And def document = response.document