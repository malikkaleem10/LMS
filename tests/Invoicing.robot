*** Settings ***
Library           Selenium2Library  timeout=5
Suite Teardown    Close All Browsers
Resource          ../resources/keywords.robot

*** Variables ***
${Invoicing_Tab}              css=.fa-receipt.side-menu_icon
${Generate_Bill}              css=[title='Generate Bill'] .btn-labeled.btn-theme

*** Test Cases ***

Scenario: User can access Invoicing tab
   Given Navigate to LMS
     and Login to LMS
    When I access invoicing tab
    Then I should see invoicing tab

*** Keywords ***

#Given

#When---------------------------------------------------------------------------
I access invoicing tab
  Wait Until Page Contains Element    ${Invoicing_Tab}
  Sleep    1s
  Click Element    ${Invoicing_Tab}

#Then---------------------------------------------------------------------------
I should see invoicing tab
  Wait Until Page Contains Element    ${Generate_Bill}
  Page Should Contain Element    ${Generate_Bill}



kaleem 
