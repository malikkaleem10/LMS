*** Settings ***
Library           Selenium2Library  timeout=5
Suite Teardown    Close All Browsers
Resource          ../resources/keywords.robot

*** Variables ***
${Top_Nav}                css=.dropdown-user .navbar-nav-link
${Logout_Button}          css=.dropdown-item .icon-switch2


*** Test Cases ***

Scenario: User can Logout
   Given Navigate to LMS
     and Login to LMS
    When I logout
    Then I should be logged out

*** Keywords ***

#Given

#When---------------------------------------------------------------------------
I logout
  Wait Until Page Contains Element    ${Top_Nav}
  Wait Until Element Is Visible    ${Top_Nav}
  Wait Until Element Is Enabled    ${Top_Nav}
  Sleep    0.5s
  Click Element    ${Top_Nav}
  Sleep    0.5s
  Wait Until Element Is Visible    ${Logout_Button}
  Wait Until Element Is Enabled    ${Logout_Button}
  Click Element    ${Logout_Button}

#Then---------------------------------------------------------------------------
I should be logged out
  Wait Until Page Contains    Login to your account
  Page Should Contain    Login to your account
  Wait Until Page Contains Element    ${Username}
  Page Should Contain Element    ${Username}
