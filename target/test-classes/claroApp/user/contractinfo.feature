Feature: Informações do contrato

  Background:

   * def resultContract = callonce read('../user/contractlist.feature@list')
   * def operatorcode = resultContract.operatorcode
   * def contractnumber = resultContract.contractnumber
   * header Content-Type = 'application/json'
   * header userInfo = java.net.URLEncoder.encode(resultContract.userinfo, 'UTF-8')
   * header x-application-key = xappkey
   * header gw-app-key = gwappkey
   * header Cache-Control = 'no-cache'
   * url userUrl
   * def decodejwt =
           """
           function(token) {
               var cl = Java.type('backend.DecodeJWT');
               var ff = new cl();
               return [ff.getContract(token), ff.getOperatorCode(token), ff.getPartner(token)];
           }
           """

  @contractinfo
  Scenario: Documento válido

    * def responseApi =
"""
{
    "contract": {
      "contractNumber": "019181308",
      "operatorCode": "052",
      "paymentType": "BILLET",
      "paymentDelivery": "EMAIL",
      "paymentEmail": "renatovieiradesouza1@gmail.com",
      "city": "05509",
      "expirationDay": "15",
      "addresses": [
        {
          "streetName": "R ALCIDIA HONORIA DA SILVEIRA",
          "streetNumber": "96",
          "neighborhood": "JARDIM FLORENCE",
          "cityName": "CAMPINAS",
          "stateAbreviation": "SP"
        }
      ],
      "products": {
        "fone": "FONE ILIM BR TOTAL 40.00",
        "tv": "MIX HD C/VTA OU FONE RENT CONF FID",
        "internet": "VIRTUA 35M EXCL BASE UP BLIND FID",
        "celular": "LIGAÇÕES GRÁTIS PARA CELULARES CLARO E NET FONE"
      },
      "token": {
        token: '#string'
      },
      "node": "F107",
      "codImovel": "366130821",
      "status": true,
      "comboMulti": true
    }
}
"""
    Given path 'contract' + "/" + operatorcode + "/" + contractnumber
	And request {}
	When method get
	Then status 200
	And match response == responseApi
	And def contracttoken = response.contract.token.token
	And match contractnumber == decodejwt(contracttoken)[0]
    And match operatorcode == decodejwt(contracttoken)[1]

  @contractinfoerror
  Scenario: Operator code inválido

  * responseApi =
"""
  {
     "statusCode":"404",
     "status":"Not Found",
     "description":"Failed to Found - URL: https://prd-gw.claro.com.br/security/v1/generate-token-by-userinfo/sms - Body: {\"statusCode\":\"404\",\"status\":\"Not Found\",\"description\":\"Dados Não encontrados.\"}"
  }
"""

    Given path 'contract' + "/" + "111" + "/" + contractnumber
	And request {}
	When method get
	Then status 404
	And match response == responseApi

  @contractinfoerror1
  Scenario: Operator code inválido

    * responseApi =
"""
    {
       "statusCode":"404",
       "status":"Not Found",
       "description":"Failed to Found - URL: https://prd-gw.claro.com.br/security/v1/generate-token-by-userinfo/sms - Body: {\"statusCode\":\"404\",\"status\":\"Not Found\",\"description\":\"Dados Não encontrados.\"}"
    }
"""

    Given path 'contract' + "/" + operatorcode + "/" + "111111111"
	And request {}
	When method get
	Then status 404
	And match response == responseApi