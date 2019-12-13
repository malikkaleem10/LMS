*** Settings ***
# Library           Selenium2Library  timeout=5
Library           SeleniumLibrary  timeout=5
Suite Teardown    Close All Browsers
Test Teardown     Close All Browsers
Resource          ../resources/keywords.robot

*** Variables ***
${URL}       https://www.seleniumeasy.com/test/
${Browser}   Chrome


*** Test Cases ***
Scenario: user can apply for annual leave
    Given Navigate to seleniumeasy
    When I drag and drop element
    Then I should see element being dragged and dropped

*** Keywords ***
#Given
Navigate to seleniumeasy
  Open Browser   ${URL}    ${Browser}

#When---------------------------------------------------------------------------
I drag and drop element
  Wait Until Page Contains Element    css=.tree-branch ul li:nth-child(7).tree-branch
  Sleep    0.5s
  Click Element    css=.tree-branch ul li:nth-child(7).tree-branch
  Wait Until Page Contains    Drag and Drop
  Sleep    0.5s
  Click Element    css=.tree-branch ul li [href='./drag-and-drop-demo.html']
  Wait Until Page Contains    Drag and Drop Demo for Automation
  Wait Until Page Contains Element    css=#todrag span:nth-child(2)
  Sleep    1s
  Mouse Down  css=#todrag span:nth-child(3)
  Mouse Over  id=mydropzone
  Mouse Up    id=mydropzone
  # Drag And Drop     css=#todrag span:nth-child(3)      css=.moveleft.w50 #mydropzone
  Sleep    1s

#Then--------------------------------------------------------------------------
I should see element being dragged and dropped
   Wait Until Page Contains Element    css=#droppedlist > span
