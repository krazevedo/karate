@all
Feature: Workflow para pegar o wcp token

  Background:
    * def result = callonce read('../user/contractinfo.feature@contractinfo')
    * def wcp = java.net.URLEncoder.encode(result.contracttoken, 'UTF-8')

  Scenario: