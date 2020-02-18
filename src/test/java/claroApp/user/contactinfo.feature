Feature: Lista de contratos

  Background:

   * def resultContract = callonce read('../../backend/security/security.feature@smstoken')
   * def token = resultContract.wcp
   * header x-wcp-token = java.net.URLEncoder.encode(token, 'UTF-8')
   * header Cache-Control = 'no-cache'
   * url userUrl

  @contactinfo
  Scenario: Documento válido

    * def responseApi =
"""
    {
       "email":"renatovieiradesouza1@gmail.com",
       "residentialPhone":"1932614633",
       "commercialPhone":"",
       "cellPhone":"19974227705",
       "contactPhone":"",
       "smsAdvertising":false
    }
"""

    Given path 'contact-information'
    And param gw-app-key = gwappkey
	And request {}
	When method get
	Then status 200
	And match response == responseApi