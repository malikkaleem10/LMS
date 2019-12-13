*** Settings ***
Library           Selenium2Library  timeout=5
Suite Teardown    Close All Browsers
Resource          keywords.robot

*** Variables ***

${Input_Forms}     css=.tree-branch[style='display: list-item;'] a[href='#']
${EnterMessage}    css=input#user-message.form-control[placeholder='Please enter your Message'][type='text']
${showmessage}     css=button[onclick='showInput();']
${yourmessage}     css=div#user-message label
${Enter_a}         css=input#sum1.form-control[placeholder='Enter value'][type='text']
${Enter_b}         css=input#sum2.form-control[type='text'][placeholder='Enter value']
${gettotal}        css=button.btn.btn-default[onclick='return total()'][type='button']
${total}           css=[style='height: 50px; width: 100%;'] label
${Checkbox_demo}   css=.tree-branch a[href='./basic-checkbox-demo.html']
${click_on}        css=input#isAgeSelected[value=''][type='checkbox']
${label}           css=div.checkbox label
${option1}         css=input.cb1-element[value=''][type='checkbox']
${checkall}        css=input.btn-primary
${Radiobuttons}    css=.tree-branch ul li [href='./basic-radiobutton-demo.html']
${maleinput}       css=input[name='optradio'][value='Male']
${getchecked}      css=#buttoncheck
${radiobuttontext}  css=div#easycont.text-center div.row div.col-md-6.text-left div.panel.panel-default div.panel-body p
${male2}            css=div.col-md-6.text-left div.panel.panel-default div.panel-body div label.radio-inline input[value='Male'][name='gender'][type='radio']
${getvalues}        css=button.btn-default.btn[onclick='getValues();']
${agegroup}         css=input[value='5 - 15']
${Dropdownlist}     css=div#easycont.text-center div.row div.col-md-3.sidenav div.panel-default.panel .panel-body .tree-branch a[href='./basic-select-dropdown-demo.html']
${Selectlistdemo}   css=.text-left.col-md-6 div.panel-default.panel div.panel-body select#select-demo.form-control option[value='Sunday']
${California}       css=select[multiple='multiple'] option[value='California']
${firstselected}    css=button#printMe.btn-primary.btn[value='Print First'][type='button']

*** Test Cases ***



Scenario: Show messasge on Selenium
      Given Navigate to seleniumeasy_URL
      When I click on Input_Forms
      Then I should be able to see the Show message

Scenario: Two input Fields
      Given Navigate to seleniumeasy_URL
      When I click input fields
      Then I should be able to see the total

Scenario: Show messasge on Selenium
       Given Navigate to seleniumeasy_URL
       When I click on Simple Form Demo
       Then I should be able to click on checkbox

Scenario: Show messasge on Radio
        Given Navigate to seleniumeasy_URL
        When I click on Radio Buttons Demo
        Then I should be able to get checked value

Scenario: Select Dropdown List
        Given Navigate to seleniumeasy_URL
        When I click on Dropdown List
        Then I should be able to see Multi Select List Demo
*** Keywords ***

#Given

Navigate to seleniumeasy_URL
          Open Browser  https://seleniumeasy.com/test/basic-first-form-demo.html   Chrome
          Maximize Browser Window


When---------------------------------------------------------------------------

I Click on Input_Forms

              Click Element      ${Input_Forms}
              Sleep  2s
              Click Element    ${EnterMessage}
              Input Text       ${EnterMessage}     IAI AUTOMATION
              Sleep  2s
              # Wait Until Page Contains Element    ${showmessage}
              Click Element    ${showmessage}
              # Sleep  2s
              # Click Element    ${Enter_a}
            Click Element    ${Enter_a}

I click input fields
              Click Element    ${Enter_a}
              Sleep  2s
              Input Text       ${Enter_a}    6
              Click Element    ${Enter_b}
              Sleep  2s
              Input Text       ${Enter_b}    100
              Sleep  2s
              Click Element    ${gettotal}

I click on Simple Form Demo

              Click Element      ${Input_Forms}
              Sleep  2s
              Wait Until Page Contains Element     ${Checkbox_demo}
              Sleep  2s
              Click Element    ${Checkbox_demo}
              Sleep  2s
              Click Element    ${click_on}
              #Sleep  2s
              #Wait Until Page Contains Element     ${label}
              Sleep  2s
              Wait Until Page Contains Element   ${option1}
              Sleep  2s
              Click Element      ${option1}
              Sleep  2s
              Wait Until Page Contains Element   ${checkall}
              Sleep  2s
              Click Element     ${checkall}
              Sleep  2s

I click on Radio Buttons Demo

              Click Element      ${Input_Forms}
              Sleep  2s
              Wait Until Page Contains Element      ${Radiobuttons}
              Sleep  2s
              Click Element    ${Radiobuttons}
              Sleep    2s
              Wait Until Page Contains Element      ${radiobuttontext}
              Sleep  2s
              Double Click Element    ${maleinput}
              Sleep  2s
              Click Element    ${getchecked}
              Sleep   2s
              Click Element     ${male2}
              Sleep  2s
              Click Element     ${agegroup}
              Sleep  2s
              Click Element     ${getvalues}
              Sleep  2s

I click on Dropdown List

                Click Element      ${Input_Forms}
                Sleep  2s
                Wait Until Page Contains Element      ${Dropdownlist}
                Sleep  2s
                Click Element     ${Dropdownlist}
                Sleep  6s
                Click Element            ${Selectlistdemo}
                Sleep   2s
                Click Element          ${California}
                Sleep   2s
                Click Element            ${firstselected}
                Sleep  2s



Then---------------------------------------------------------------------------
I should be able to see the Show message

                Wait Until Page Contains     Your Message:
                Element Text Should Be    ${yourmessage}    Your Message:

I should be able to see the total

                Element Text Should Be    ${total}     Total a + b =



I should be able to click on checkbox

              Element Text Should Be   ${label}    Click on this check box


I should be able to get checked value

          Wait Until Page Contains element     ${radiobuttontext}



I should be able to see Multi Select List Demo


                Wait Until Page Contains element     ${Dropdownlist}
