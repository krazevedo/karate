Feature: Pegar código de barra

  Background:

   * def resultwcp = callonce read('../../backend/security/security.feature@smstoken')
   * def resultkey = callonce read('../utils/keycode.feature')
   * header x-wcp-token = java.net.URLEncoder.encode(resultwcp.wcp, 'UTF-8')
   * header Cache-Control = 'no-cache'
   * url financialUrl

  @codebar
  Scenario: Validar código de barras

    * def responseApi =
"""
{
  "entity": {
    "codeLine": "84670000002-536330296201-691215052000-100171612148-6",
    "codeBar": "84670000002363302962019121505200000171612148"
  },
  "responseStatus": {
    "status": true,
    "arrayOfMessage": [
      "Operação executada com sucesso"
    ]
  }
}

"""
    * params { cityId: '#(city)', keycode: '#(resultkey.keycode)', gw-app-key: '#(gwappkey)' }
    Given path 'codebar'
	And request {}
	When method get
	Then status 202
	And match response == responseApi

  @codebarerror
  Scenario: Validar código de barras

    * def responseApi =
"""
{
  "entity": {
    "codeLine": "",
    "codeBar": ""
  },
  "responseStatus": {
    "status": true,
    "arrayOfMessage": [
      "Operação executada com sucesso"
    ]
  }
}

"""
    * params { cityId: '11111', keycode: '#(resultkey.keycode)', gw-app-key: '#(gwappkey)' }
    Given path 'codebar'
	And request {}
	When method get
	Then status 401
	And match response == responseApi

  @codebarerror
  Scenario: Validar código de barras

    * def responseApi =
"""
{
  "entity": {
    "codeLine": "",
    "codeBar": ""
  },
  "responseStatus": {
    "status": false,
    "arrayOfMessage": [
      "Unauthorized"
    ]
  }
}

"""
    * params { cityId: '#(city)', keycode: '111', gw-app-key: '#(gwappkey)' }
    Given path 'codebar'
	And request {}
	When method get
	Then status 401
	And match response == responseApi