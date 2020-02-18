Feature: Verificar se a APi está de pé

  Background:

#   * def result = callonce read('../../claroApp/utils/fuzz.feature')
#   * def scannumber = result.scannumber
   * header Content-Type = 'application/x-www-form-urlencoded'
   * cookies {sessions: '%7B%7D', _Fuzzer-app_session: 'WFM4dFVOV1BkQXlnRUk0enRaa2VEUEo4aTlKZW5mZWpNcXhSM0RyVVJNWWI3bzB1RDZ2MmxJZS83V2JpK1FUcEpjNThMem5Hc2NwZjA2YTdmdnlTQ1NmbEtyQnhnY0xvbnFTSDJaODlXR2M2cUxVeGJFdU9PSktuRWk1NHFUaDVBRTkyNjBUamRDTHZRTEFLMTF6cEZ3enBTdGF5YWRobGJSUk00LzNGU1ZHeTVWZHNkRWhtMVNTaW1iaUExRU0vajI4V09UVGwyTXNOUUJRdVJhbjluSWlRV1FPcGM4Q05OVTR1UXlFQ1hGTT0tLURBRnlHaTQySnNScHdSbVpYSllTWXc9PQ%3D%3D--304969adcb2836e9f8637df442812c69c2face4c'}
    * def table =
        """
        function(html) {
          var cl = Java.type('claroApp.utils.ParseHTML');
          var ff = new cl();
          return ff.getTable(html);
          }
        """
    * def high =
        """
        function(html) {
          var cl = Java.type('claroApp.utils.ParseHTML');
          var ff = new cl();
          return ff.getHigh(html);
          }
        """

  @get
  Scenario: Validar saúde da API

    * configure retry = { count: 10, interval: 20000 }

    Given url 'http://localhost:3000/scans/' + scannumber
    And retry until responseStatus == 200 && karate.get('table(response)')[0] > 0
    When method get
    And def hasidor = karate.get('high(response)')

    Given url 'http://localhost:3000/scan/' + scannumber + '/vulnerabilities/chart'
    When method get
    Then def qtdhigh = response[2].y
    And eval if (hasidor == 1) qtdhigh = qtdhigh - 1
    And match qtdhigh == 0
