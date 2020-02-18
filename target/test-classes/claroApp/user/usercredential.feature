Feature: Credenciais do usuário

  Background:

   * header Content-Type = 'application/json'
   * header Cache-Control = 'no-cache'
   * url userUrl

  @usercredencial
  Scenario: Documento válido

    Given path 'user-credential'
	And request {}
	And param document = document
    And param gw-app-key = gwappkey
	When method get
	Then status 200

  @usercredencialerror
  Scenario: Documento inválido

    Given path 'user-credential'
	And request {}
	And param document = "11111111111"
    And param gw-app-key = gwappkey
	When method get
	Then status 404
