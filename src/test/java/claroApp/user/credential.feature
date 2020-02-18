Feature: Credencial do usuário

  Background:

   * header Cache-Control = 'no-cache'
   * url userUrl

  @credencial
  Scenario: Documento válido

    Given path 'credential'
	And request {}
	And param document = document
    And param gw-app-key = gwappkey
	When method get
	Then status 200

  @credencialerror
  Scenario: Documento válido

    Given path 'credential'
	And request {}
	And param document = "11111111111"
    And param gw-app-key = gwappkey
	When method get
	Then status 404