*** Settings ***
# Library           Selenium2Library  timeout=5
Library           SeleniumLibrary  timeout=5
Suite Teardown    Close All Browsers
Test Teardown     Close All Browsers
Resource          ../resources/keywords.robot

*** Variables ***
${username}      css=[placeholder='Username'][type='text']
${password}      css=[placeholder='Password'][type='password']
${login}         css=.btn-login
${accept}        css=button.bg-theme
${leaves}        css=.fa-running.side-menu_icon
${applyleave}    css=[data-submenu-title='leaves'] .nav-item .nav-link[href='/leaves/apply-leave']
${apply on employeee's behalf}      css=.theme-border .btn-theme
${employee_search}            css=.css-1hwfws3
${employee_search_field}        css=.form-group .css-yk16xz-control .css-1hwfws3 .css-w8afj7-Input input#react-select-3-input
${Leave_Type}                     css=.col-md-8 .css-1hwfws3
*** Test Cases ***
# Scenario: I access the leaves tab from side menu
#     Given Navigate to LMS
#     and Login to LMS
#     When I access the leaves tab from side menu
#     Then I should be able to see applyleave
#
# Scenario: I access the applyleaves tab from side menu
#   Given Navigate to LMS
#   and Login to LMS
#   When I access the applyleaves tab from side menu
#   Then I should be able to see Leave Selection

# Scenario: I access the button apply on employeee's behalf
#     Given Navigate to LMS
#     and Login to LMS
#     When I acces the button apply on employeee's behalf
#     Then I should be able to see the button apply on employeee's behalf
#
# Scenario: I access the employee_search_field
#     Given Navigate to LMS
#     and Login to LMS
#     When I acces the employee_search_field
#     Then I should be able to see the employee_search_field

Scenario: user can apply for annual leave
    Given Navigate to LMS
    and Login to LMS
    When I apply for the annual leave
    Then I should be able to apply for the annual leave

*** Keywords ***
#Given

#When---------------------------------------------------------------------------
I access the leaves tab from side menu
  Wait Until Page Contains Element    ${leaves}
  Sleep    1s
  Click Element     ${leaves}

I access the applyleaves tab from side menu
  Wait Until Page Contains Element    ${leaves}
  Sleep    1s
  Click Element     ${leaves}
  Wait Until Page Contains Element    ${applyleave}
  # wait until element is visible  ${applyleave}
  Sleep    1s
  Click Element    ${applyleave}

I acces the button apply on employeee's behalf
  Wait Until Page Contains Element    ${leaves}
  Sleep    1s
  Click Element     ${leaves}
  Wait Until Page Contains Element    ${applyleave}
  Sleep    1s
  Click Element    ${applyleave}
  Wait Until Page Contains Element     ${apply on employeee's behalf}
  Set Selenium Speed    2s
  Sleep    1s
  # Click Element    ${apply on employeee's behalf}
  Click Button    APPLY ON EMPLOYEE's BEHALF

I acces the employee_search_field
   Wait Until Page Contains Element    ${leaves}
   Sleep    1s
   Click Element     ${leaves}
   Wait Until Page Contains Element    ${applyleave}
   Sleep    1s
   Click Element    ${applyleave}
   Wait Until Page Contains Element     ${apply on employeee's behalf}
   Sleep    1s
   # Click Element    ${apply on employeee's behalf}
   Click Button    APPLY ON EMPLOYEE's BEHALF
   Sleep    1s
   Wait Until Page Contains Element    ${employee_search_field}

I apply for the annual leave
    Wait Until Page Contains Element    ${leaves}
    Sleep    1s
    Click Element     ${leaves}
    Wait Until Page Contains Element    ${applyleave}
    Sleep    1s
    Click Element    ${applyleave}
    Wait Until Page Contains Element     ${apply on employeee's behalf}
    Sleep    1s
    # Click Element    ${apply on employeee's behalf}
    Click Button    APPLY ON EMPLOYEE's BEHALF
    Sleep    1s
    Wait Until Page Contains Element    ${employee_search}
    Click Element    ${employee_search}
    Sleep    1s
    Press Keys   ${employee_search}    USER11
    Sleep    0.5s
    Press Key   ${employee_search}    \\13
    Sleep    0.5s
    Press Keys   ${Leave_Type}    Annual
    Sleep    0.5s
    Press Keys    ${Leave_Type}    \\13

#Then--------------------------------------------------------------------------
I should be able to see applyleave
  Wait Until Page Contains Element    ${applyleave}

I should be able to see Leave Selection
  Wait Until Page Contains      Leave Selection

I should be able to see the button apply on employeee's behalf
  Wait Until Page Contains      Employee Selection

I should be able to see the employee_search_field
   Wait Until Page Contains Element     ${employee_search_field}

I should be able to apply for the annual leave
    No Operation
