*** Settings ***
# Library           Selenium2Library  timeout=5
Library           SeleniumLibrary  timeout=5
Suite Teardown    Close All Browsers
Test Teardown     Close All Browsers
Resource          keywords.robot

*** Variables ***
${Search_Bar}       css=[title='Enter your search term']
${Search_Icon}      css=#sb_go_par [type='submit']


*** Test Cases ***
Scenario: i can search my name
  Given Navigate to Bing_URL
  When I write my name in search_bar
  Then I should see my name

*** Keywords ***
#Given
Navigate to Bing_URL
  Open Browser    https://www.bing.com/      chrome
#When---------------------------------------------------------------------------

I write my name in search_bar
  Wait Until Page Contains Element    ${Search_Bar}
  Input Text    ${Search_Bar}     kaleem
  Click Element    ${Search_Icon}


#Then--------------------------------------------------------------------------
I should see my name
  Wait Until Page Contains   kaleem
wha bhae mazay 
