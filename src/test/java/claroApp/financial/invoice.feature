Feature: Nota fiscal

  Background:

   * def resultwcp = callonce read('../../backend/security/security.feature@smstoken')
   * def resultkey = callonce read('../utils/keycode.feature')
   * header x-wcp-token = java.net.URLEncoder.encode(resultwcp.wcp, 'UTF-8')
   * header Cache-Control = 'no-cache'
   * url financialUrl

  @invoice
  Scenario: Validar nota fiscal

    * params { cityId: '#(city)', keycode: '#(resultkey.keycode)', gw-app-key: '#(gwappkey)' }
    Given path 'invoice'
	And request {}
	When method get
	Then status 200

  @invoiceerror
  Scenario: Validar nota fiscal

    * params { cityId: '11111', keycode: '#(resultkey.keycode)', gw-app-key: '#(gwappkey)' }
    Given path 'invoice'
	And request {}
	When method get
	Then status 401

  @invoiceerror
  Scenario: Validar nota fiscal

    * params { cityId: '#(city)', keycode: '111', gw-app-key: '#(gwappkey)' }
    Given path 'invoice'
	And request {}
	When method get
	Then status 401