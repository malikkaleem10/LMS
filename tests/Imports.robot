*** Settings ***
Library           Selenium2Library  timeout=5
Suite Teardown    Close All Browsers
Resource          ../resources/keywords.robot

*** Variables ***
${Imports_Tab}                css=.fa-file-import.side-menu_icon

*** Test Cases ***

Scenario: User can access imports tab
   Given Navigate to LMS
     and Login to LMS
    When I access imports tab
    Then I should see imports tab

*** Keywords ***

#Given

#When---------------------------------------------------------------------------
I access imports tab
  Wait Until Page Contains Element    ${Imports_Tab}
  Sleep    0.5s
  Click Element    ${Imports_Tab}

#Then---------------------------------------------------------------------------
I should see imports tab
  Wait Until Page Contains    General Instructions
  Page Should Contain    General Instructions
