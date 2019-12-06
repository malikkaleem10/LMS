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
${View_Employees}      css=[data-submenu-title='employees'] .nav-link[href='/employees']
${Add_Employees}       css=[data-submenu-title='employees'] .nav-link[href='/employees/add-employee']

*** Test Cases ***
Scenario: User can access employees tab
   Given Navigate to FRONTEND_URL
     and Login to site
    When I access employees tab from side menu
    Then I should see view employees

Scenario: User can access view employees tab
    Given Navigate to FRONTEND_URL
      and Login to site
     When I access view employees tab from side menu
     Then I should see view employees window

Scenario: User can access view employees tab
    Given Navigate to FRONTEND_URL
      and Login to site
     When I access add employees tab from side menu

     Then I should see add employees window

*** Keywords ***
#Given

#When---------------------------------------------------------------------------

I access employees tab from side menu
  Wait Until Page Contains Element    ${Employees}
  Set Focus To Element   ${Employees}
  Sleep    2s
  Click Element    ${Employees}

I access view employees tab from side menu
  Wait Until Page Contains Element    ${Employees}
  Set Focus To Element   ${Employees}
  Sleep    2s
  Click Element    ${Employees}
  Wait Until Page Contains Element    ${View_Employees}
  Click Element    ${View_Employees}

I access add employees tab from side menu
  Wait Until Page Contains Element    ${Employees}
  Set Focus To Element   ${Employees}
  Sleep    2s
  Click Element    ${Employees}
  Wait Until Page Contains Element    ${Add_Employees}
  Wait until element is Visible       ${Add_Employees}
  Sleep    1s
  Click Element    ${Add_Employees}

I access update team tab from side menu
  Wait Until Page Contains Element    ${Employees}
  Set Focus To Element   ${Employees}
  Sleep    2s
  Click Element    ${Employees}
  Wait Until Page Contains Element    ${Update_Team}
  Wait until element is Visible       ${Update_Team}
  Sleep    1s
  Click Element    ${Update_Team}


#Then--------------------------------------------------------------------------
I should see view employees
  Wait Until Page Contains Element    ${View_Employees}
  Element Should Be Visible    ${View_Employees}

I should see view employees window
  Location Should Be    ${SERVER}employees
  Page Should Contain    Search by Employee Name/ID

I should see add employees window
  Location Should Be    ${SERVER}employees/add-employee
  Page Should Contain    Personal Details
