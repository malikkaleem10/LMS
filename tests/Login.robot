*** Settings ***
# Library           Selenium2Library  timeout=5
Library           SeleniumLibrary  timeout=5
Suite Teardown    Close All Browsers
Test Teardown     Close All Browsers
Resource          keywords.robot

*** Variables ***
${Invalid_Username}    css=input[placeholder='Username']
${Invalid_Password}    css=input[placeholder='Password']

${Employees}           css=.fa-users.side-menu_icon


#

${View_Employees}     css=[data-submenu-title='employees'] .nav-link[href='/employees']
*** Test Cases ***
Scenario: User can Login with valid credentials
   Given Navigate to FRONTEND_URL
    When I enter valid credentials
    Then I should be able to login

Scenario: User can Login with invalid credentials
   Given Navigate to FRONTEND_URL
    When I enter invalid credentials
    Then I should not be able to login

Scenario: User cannot Login with valid password and invalid username
   Given Navigate to FRONTEND_URL
    When I enter invalid username
     and I enter valid password
    Then I should not be able to login

Scenario: User can open employees
   Given Navigate to FRONTEND_URL
    When I access employees tab from side menu
    Then I should see view employees

*** Keywords ***


#Given

#When---------------------------------------------------------------------------
I enter valid credentials
  Input Text    ${Username}    iamsaqib@gmail.com
  Input Text    ${Password}    1212
  Click Element    ${Login_Button}

I enter invalid credentials
  Input Text    ${Invalid_Username}    iasaqib@gmail.com
  Input Text    ${Invalid_Password}    121
  Click Element    ${Login_Button}

I enter invalid username
  Input Text    ${Invalid_Username}    iasaqib@gmail.com

I enter valid password
  Input Text    ${Password}    1212
  Click Element    ${Login_Button}

I access employees tab from side menu
  Input Text    ${Username}    iamsaqib@gmail.com
  Input Text    ${Password}    1212
  Click Element    ${Login_Button}
  Wait Until Page Contains Element    ${Accept_Button}
  Click Element    ${Accept_Button}
  Wait Until Page Contains Element    ${Employees}
  Set Focus To Element   ${Employees}
  Sleep    2s
  Click Element    ${Employees}


#Then---------------------------------------------------------------------------
I should be able to login
   Wait Until Page Contains Element    ${Accept_Button}
   Click Element    ${Accept_Button}

I should not be able to login
   Wait Until Page Contains    The user name or password is incorrect.
   Page Should Not Contain Element      ${Accept_Button}

I should see view employees
  Wait Until Page Contains Element    ${View_Employees}
  Element Should Be Visible    ${View_Employees}
