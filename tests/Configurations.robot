*** Settings ***
Library           Selenium2Library  timeout=5
Suite Teardown    Close All Browsers
Resource          ../resources/keywords.robot

*** Variables ***
${Configurations_Tab}                css=.fa-cog.side-menu_icon
${Exception}                         css=[title='Click or press Escape to dismiss.']


*** Test Cases ***

Scenario: User can access configurations tab
   Given Navigate to LMS
     and Login to LMS
    When I access configurations tab
    Then I should see configurations tab

*** Keywords ***

#Given

#When---------------------------------------------------------------------------
I access configurations tab
  Wait Until Page Contains Element    ${Configurations_Tab}
  Sleep    0.5s
  Click Element    ${Configurations_Tab}

#Then---------------------------------------------------------------------------
I should see configurations tab
  Wait Until Page Contains    Configurations
  Page Should Contain    Configurations
  Page Should Not Contain    Unhandled
  Page Should Not Contain Element    ${Exception}
