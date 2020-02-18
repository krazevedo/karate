Feature: Consumo

  Background:

   * def result = callonce read('../../backend/security/security.feature@smstoken')
   * header x-wcp-token = java.net.URLEncoder.encode(result.wcp, 'UTF-8')
   * header Cache-Control = 'no-cache'
   * header Content-Type = 'application/json'
   * url technicianzupUrl

   * def currentMonth =
       """
       function() {
        var months    = ['Janeiro','Fevereiro','Março','Abril','Maio','Junho','Julho','Agosto','Setembro','Outubro','Novembro','Dezembro'];
        var now       = new Date();
        var thisMonth = months[now.getMonth()];
        return thisMonth
       }
       """

  @consumption
  Scenario: Validar consumo

    * def body =
"""
{
  "month": "<month>",
  "macAddress": "<macAddress>",
  "descriptionProduct": "<productInternet>",
  "reportType": "DETALHADO"
}
"""
    * replace body.macAddress = mac
    * replace body.productInternet = product
    * replace body.month = currentMonth()


    Given path 'routers/consumption/pdf'
	And request body
    And param gw-app-key = gwappkey
	When method post
	Then status 200

  @consumptionerror
  Scenario: Validar consumo com valor de mês invalido

    * def body =
"""
{
  "month": "<month>",
  "macAddress": "<macAddress>",
  "descriptionProduct": "<productInternet>",
  "reportType": "DETALHADO"
}
"""
    * replace body.macAddress = mac
    * replace body.productInternet = product
    * replace body.month = "dsahiuashiushaiuhdsaiuhdsaiuhdsaiuhdsaiuhsaiuhadsiuh"


    Given path 'routers/consumption/pdf'
	And request body
    And param gw-app-key = gwappkey
	When method post
	Then status 200