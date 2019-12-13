*** Settings ***
Library           Selenium2Library  timeout=5
Suite Teardown    Close All Browsers
Resource          keywords.robot

*** Variables ***

${Input_Forms}    css=.tree-branch[style='display: list-item;'] a[href='#']
${EnterMessage}   css=input#user-message.form-control[placeholder='Please enter your Message'][type='text']
${showmessage}    css=button.btn-default.btn[onclick='showInput();'][type='button']
${youmessage}     css=#user-message label



*** Test Cases ***

Scenario: Show messasge on Selenium
      Given Navigate to URL
      When I click on Input_Forms
      Then I should be able to see the Show message

      *** Keywords ***

#Given

      Navigate to IRMS_URL
          Open Browser  https://www.seleniumeasy.com/test/basic-first-form-demo.html Chrome
          Maximize Browser Window

#When---------------------------------------------------------------------------

          I Click on Input_Forms
              Click Element      ${Input_Forms}
              Sleep 2s
              Click Element    ${Login_Button}
              Input Text       ${EnterMessage}     IAI AUTOMATION
              Sleep 2s
              Wait Until Page Contains Element    ${showmessage}
              Click Element    ${showmessage}


#Then---------------------------------------------------------------------------
            I should be able to see the Show message

                  Wait Until Page Contains Element  ${youmessage}
