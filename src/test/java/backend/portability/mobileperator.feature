Feature: Portabilidade

  Background:

   * header X-Application-Key = gwappkey
   * url portabilityUrl

  @mobileoperators
  Scenario: Validar lista de operadoras

    * def responseApi =
"""
[
   {
      "identifier":"81",
      "description":"51 BRASIL SETOR 31"
   },
   {
      "identifier":"3",
      "description":"AEROTECH"
   },
   {
      "identifier":"5",
      "description":"ALPHA NOBILIS"
   },
   {
      "identifier":"6",
      "description":"AMAZONIA CELULAR S/A"
   },
   {
      "identifier":"7",
      "description":"AMERICEL S.A."
   },
   {
      "identifier":"8",
      "description":"AMIGO TELECOM"
   },
   {
      "identifier":"9",
      "description":"BBS OPTIONS"
   },
   {
      "identifier":"11",
      "description":"BBT"
   },
   {
      "identifier":"12",
      "description":"BCP S.A."
   },
   {
      "identifier":"13",
      "description":"BRASIL TELECOM"
   },
   {
      "identifier":"1",
      "description":"BRASIL TELECOM CELULAR S/A"
   },
   {
      "identifier":"2",
      "description":"BRASIL TELECOMUNICAÇÕES LTDA."
   },
   {
      "identifier":"14",
      "description":"BT"
   },
   {
      "identifier":"16",
      "description":"CONECTA"
   },
   {
      "identifier":"18",
      "description":"CONVERGIA TELECOM"
   },
   {
      "identifier":"15",
      "description":"CTBC"
   },
   {
      "identifier":"19",
      "description":"CTBC CELULAR S.A."
   },
   {
      "identifier":"62",
      "description":"DOLLARPHONE"
   },
   {
      "identifier":"20",
      "description":"DSLI VOX"
   },
   {
      "identifier":"21",
      "description":"EASYTONE TELECOM"
   },
   {
      "identifier":"22",
      "description":"EMBRATEL"
   },
   {
      "identifier":"23",
      "description":"ENGEVOX TELECOM"
   },
   {
      "identifier":"25",
      "description":"EPSILON TELECOM"
   },
   {
      "identifier":"26",
      "description":"ETML"
   },
   {
      "identifier":"27",
      "description":"FALKLAND"
   },
   {
      "identifier":"28",
      "description":"FONAR"
   },
   {
      "identifier":"32",
      "description":"GOLDEN LINE TELECOM"
   },
   {
      "identifier":"33",
      "description":"GT GROUP"
   },
   {
      "identifier":"50",
      "description":"GVT"
   },
   {
      "identifier":"29",
      "description":"GVT"
   },
   {
      "identifier":"4",
      "description":"HIP TELECOM"
   },
   {
      "identifier":"34",
      "description":"IDT BRASIL"
   },
   {
      "identifier":"35",
      "description":"IMPSAT"
   },
   {
      "identifier":"36",
      "description":"INTELIG"
   },
   {
      "identifier":"37",
      "description":"LINKNET"
   },
   {
      "identifier":"39",
      "description":"LOCAL TELECOM"
   },
   {
      "identifier":"40",
      "description":"MUNDIVOX"
   },
   {
      "identifier":"41",
      "description":"NEXUS"
   },
   {
      "identifier":"42",
      "description":"NORTELPA"
   },
   {
      "identifier":"43",
      "description":"OSTARA TELECOM"
   },
   {
      "identifier":"44",
      "description":"PLENNA TELECOM"
   },
   {
      "identifier":"46",
      "description":"PRIMEIRA ESCOLHA"
   },
   {
      "identifier":"47",
      "description":"REDEVOX"
   },
   {
      "identifier":"48",
      "description":"REMOTA TELECOM"
   },
   {
      "identifier":"49",
      "description":"RN BRASIL"
   },
   {
      "identifier":"53",
      "description":"SERCOMTEL"
   },
   {
      "identifier":"51",
      "description":"SERCOMTEL CELULAR S.A."
   },
   {
      "identifier":"54",
      "description":"SERMATEL"
   },
   {
      "identifier":"55",
      "description":"SIGNALLINK"
   },
   {
      "identifier":"56",
      "description":"STELLAR S/A"
   },
   {
      "identifier":"57",
      "description":"SUPORTE TECNOLOGIA"
   },
   {
      "identifier":"70",
      "description":"T-LESTE TELECOM"
   },
   {
      "identifier":"58",
      "description":"TELEBIT"
   },
   {
      "identifier":"60",
      "description":"TELECOMDADOS"
   },
   {
      "identifier":"61",
      "description":"TELEFONICA"
   },
   {
      "identifier":"64",
      "description":"TELEFREE"
   },
   {
      "identifier":"63",
      "description":"TELEFÔNICA S.A."
   },
   {
      "identifier":"65",
      "description":"TELEMAR"
   },
   {
      "identifier":"67",
      "description":"TELEMIG CELULAR S.A"
   },
   {
      "identifier":"30",
      "description":"TELENOVA COMUNICAÇÕES"
   },
   {
      "identifier":"68",
      "description":"TIM"
   },
   {
      "identifier":"69",
      "description":"TIM CELULAR S.A."
   },
   {
      "identifier":"71",
      "description":"TMAIS"
   },
   {
      "identifier":"72",
      "description":"TNL PCS S.A."
   },
   {
      "identifier":"74",
      "description":"TRANSIT BRASIL"
   },
   {
      "identifier":"75",
      "description":"UNICEL DO BRASIL TELECOMUNICAÇÕES LTDA."
   },
   {
      "identifier":"76",
      "description":"VIVO S.A."
   },
   {
      "identifier":"77",
      "description":"VOX"
   }
]
"""

    Given path 'mobile-operators'
    And param cityId = '1'
    When method get
	Then status 200
    And match response == responseApi

  @mobileoperatorserror
  Scenario: Validar erro ao enviar sem cityId

    * def responseApi =
"""
{
  "statusCode":"400",
  "status":"Bad Request",
  "description":"Required Long parameter 'cityId' is not present"
}
"""

    Given path 'mobile-operators'
    When method get
    Then status 400
    And match response == responseApi

  @mobileoperatorserror
  Scenario: Validar erro ao enviar cityId nula

    * def responseApi =
"""
{
  "statusCode":"400",
  "status":"Bad Request",
  "description":"cityId: Parâmetro ausente ou fora do padrão!"
}
"""

    Given path 'mobile-operators'
    And param cityId = ''
    When method get
    Then status 400
    And match response == responseApi

  @mobileoperatorserror
  Scenario: Validar erro ao enviar cityId inválido

    * def responseApi =
"""
{
  "statusCode":"400",
  "status":"Bad Request",
  "description":"cityId: Parâmetro ausente ou fora do padrão!"
}
"""

    Given path 'mobile-operators'
    And param cityId = 'aaa'
    When method get
    Then status 400
    And match response == responseApi

  @mobileoperatorserror
  Scenario: Validar erro ao enviar cityId inválido

    * def responseApi =
"""
{
  "statusCode":"400",
  "status":"Bad Request",
  "description":"cityId: Parâmetro ausente ou fora do padrão!"
}
"""

    Given path 'mobile-operators'
    And param cityId = '1231243434343324'
    When method get
    Then status 400
    And match response == responseApi

  @mobileoperatorserror
  Scenario: Validar erro ao enviar application key inválido

    * def responseApi =
"""
{
  "statusCode":403,
  "error":"Forbidden",
  "message":"Application key is not allowed to call this resource method"
}
"""
    * header X-Application-Key = 'gwappkey'
    Given path 'mobile-operators'
    And param cityId = '1'
    When method get
    Then status 403
    And match response == responseApi

  @mobileoperatorserror
  Scenario: Validar erro ao enviar método delete

    * def responseApi =
"""
{
  "statusCode":405,
  "error":"Method Not Allowed",
  "message":"Resource Method not found"
}
"""

    Given path 'mobile-operators'
    And param cityId = '1'
    When method delete
    Then status 405
    And match response == responseApi

  @mobileoperatorserror
  Scenario: Validar erro ao enviar método put

    * def responseApi =
"""
{
  "statusCode":405,
  "error":"Method Not Allowed",
  "message":"Resource Method not found"
}
"""

    Given path 'mobile-operators'
    And param cityId = '1'
    And request {}
    When method put
    Then status 405
    And match response == responseApi

  @mobileoperatorserror1
  Scenario: Validar erro ao enviar método post

    * def responseApi =
"""
{
  "statusCode":405,
  "error":"Method Not Allowed",
  "message":"Resource Method not found"
}
"""

    Given path 'mobile-operators'
    And param cityId = '1'
    And request {}
    When method post
    Then status 405
    And match response == responseApi