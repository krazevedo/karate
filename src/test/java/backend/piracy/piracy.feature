Feature: Pirataria

  Background:

   * header X-Application-Key = gwappkey
   * header Content-Type = 'application/json'
   * url piracyUrl

  @piracy
  Scenario: Validar criação de pirataria

    * def body =
"""
{
    "suspeitas": "teste 1",
    "fraude": "n/a",
    "identificacao": "n/a",
    "cep": "04709-110",
    "endereco": "R. Henri Dunant",
    "numero": "780",
    "complemento": "",
    "bairro": "Chácara Santo Antôn",
    "cidade": "São Paulo",
    "estado": "SP"
}
"""

    Given path 'report/piracy'
	And request body
    When method post
	Then status 201

  @piracyerror
  Scenario: Validar criação de pirataria com campos em branco

    * def body =
"""
{
    "suspeitas": "",
    "fraude": "",
    "identificacao": "",
    "cep": "",
    "endereco": "",
    "numero": "",
    "complemento": "",
    "bairro": "",
    "cidade": "",
    "estado": ""
}
"""

    Given path 'report/piracy'
	And request body
    When method post
	Then status 201

  @piracyerror
  Scenario: Validar criação de pirataria com campos em branco

    * def body =
"""
{
}
"""

    Given path 'report/piracy'
	And request body
    When method post
	Then status 400

  @piracyerror1
  Scenario: Validar criação de pirataria com campos em branco

    * def body =
"""
{
    "suspeitas": "fij o !@$%*()",
    "fraude": "fij o !@$%*()",
    "identificacao": "fij o !@$%*()",
    "cep": "fij o !@$%*()",
    "endereco": "fij o !@$%*()",
    "numero": "fij o !@$%*()",
    "complemento": "",
    "bairro": "fij o !@$%*()",
    "cidade": "fij o !@$%*()",
    "estado": "fij o !@$%*()"
}
"""

    Given path 'report/piracy'
	And request body
    When method post
	Then status 412

  @piracyerror
  Scenario: Validar criação de pirataria com campos em branco

    * def body =
"""
{
    "suspeitas": "saiuhsiuhiuahuiashiuahsiuhsaiuhsaiuhsaiuhsaiuhsaiuhsuahaisuu",
    "fraude": "saiuhsiuhiuahuiashiuahsiuhsaiuhsaiuhsaiuhsaiuhsaiuhsuahaisuu",
    "identificacao": "saiuhsiuhiuahuiashiuahsiuhsaiuhsaiuhsaiuhsaiuhsaiuhsuahaisuu",
    "cep": "saiuhsiuhiuahuiashiuahsiuhsaiuhsaiuhsaiuhsaiuhsaiuhsuahaisuu",
    "endereco": "saiuhsiuhiuahuiashiuahsiuhsaiuhsaiuhsaiuhsaiuhsaiuhsuahaisuu",
    "numero": "saiuhsiuhiuahuiashiuahsiuhsaiuhsaiuhsaiuhsaiuhsaiuhsuahaisuu",
    "complemento": "saiuhsiuhiuahuiashiuahsiuhsaiuhsaiuhsaiuhsaiuhsaiuhsuahaisuu",
    "bairro": "saiuhsiuhiuahuiashiuahsiuhsaiuhsaiuhsaiuhsaiuhsaiuhsuahaisuu",
    "cidade": "saiuhsiuhiuahuiashiuahsiuhsaiuhsaiuhsaiuhsaiuhsaiuhsuahaisuu",
    "estado": "saiuhsiuhiuahuiashiuahsiuhsaiuhsaiuhsaiuhsaiuhsaiuhsuahaisuu"
}
"""

    Given path 'report/piracy'
	And request body
    When method post
	Then status 412