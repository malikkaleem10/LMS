*** Settings ***
Library           Selenium2Library  timeout=5
Suite Teardown    Close All Browsers
Resource          ../resources/keywords.robot

*** Variables ***
${Announcements_Tab}                css=.fa-bullhorn.side-menu_icon
${Add_Announcement}                 css=[title='Add New Announcement'] .btn-labeled-left


*** Test Cases ***

Scenario: User can access announcements tab
   Given Navigate to LMS
     and Login to LMS
    When I access announcements tab
    Then I should see announcements tab

*** Keywords ***

#Given

#When---------------------------------------------------------------------------
I access announcements tab
  Wait Until Page Contains Element    ${Announcements_Tab}
  Sleep    0.5s
  Click Element    ${Announcements_Tab}

#Then---------------------------------------------------------------------------
I should see announcements tab
  Wait Until Page Contains Element    ${Add_Announcement}
  Page Should Contain Element    ${Add_Announcement}
