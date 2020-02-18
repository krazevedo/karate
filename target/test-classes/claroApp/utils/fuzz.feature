@fuzz
Feature: Verificar se a APi está de pé

  Background:


   * header Content-Type = 'application/x-www-form-urlencoded'
   * cookies {sessions: '%7B%7D', _Fuzzer-app_session: 'WFM4dFVOV1BkQXlnRUk0enRaa2VEUEo4aTlKZW5mZWpNcXhSM0RyVVJNWWI3bzB1RDZ2MmxJZS83V2JpK1FUcEpjNThMem5Hc2NwZjA2YTdmdnlTQ1NmbEtyQnhnY0xvbnFTSDJaODlXR2M2cUxVeGJFdU9PSktuRWk1NHFUaDVBRTkyNjBUamRDTHZRTEFLMTF6cEZ3enBTdGF5YWRobGJSUk00LzNGU1ZHeTVWZHNkRWhtMVNTaW1iaUExRU0vajI4V09UVGwyTXNOUUJRdVJhbjluSWlRV1FPcGM4Q05OVTR1UXlFQ1hGTT0tLURBRnlHaTQySnNScHdSbVpYSllTWXc9PQ%3D%3D--304969adcb2836e9f8637df442812c69c2face4c'}
    * def scan =
        """
        function(html) {
          var cl = Java.type('claroApp.utils.ParseHTML');
          var ff = new cl();
          return ff.getScanNumber(html);
          }
        """

  @post
  Scenario: Validar saúde da API

    * def formdata =
    """
    {
      authenticity_token: 'kxSQJ57VgXYXLNmsmBYyJU+PgasOaYlLCZmQx1prtOi+2b7slSx/3YjUeoKCa4tg1jyMeIUTS6+FCPiowaX8xA==',
      url: 'https://claro.dev.gateway.zup.me/ecare-cms/v1/menu',
      method[]: 'GET',
      headers: x-application-key: '2251d8c0a94601364c54000d3ac06d76',
      cityCode: 'undefined',
      parameters: 'gw-app-key=2251d8c0a94601364c54000d3ac06d76'
    }
    """

    Given url 'http://localhost:3000/scans'
	And form fields formdata
	When method post
	Then status 200
    And def scannumber = scan(response)
    And print "******* RUN SCAN NUMBER: " + scannumber
