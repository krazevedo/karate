@history
Feature: Histórico de pagamentos

  Background:

   * def result = callonce read('../financial/history.feature@history')
   * def keycode = result.keycode


  Scenario: