# This file contains global variables and keywords that are shared across all
# tests. Please do not add any test specific keywords here!

*** Settings ***

Library  SeleniumLibrary  timeout=5


*** Variables ***
${SERVER}                  http://192.168.1.210:3000/
${BROWSER}                 chrome
${Username}                css=input[placeholder='Username']
${Password}                css=input[placeholder='Password']
${Login_Button}            css=.btn-login
${Accept_Button}           css=.modal-footer .bg-theme

*** Keywords ***
#Given
Navigate to LMS
  Open Browser  ${SERVER}  ${BROWSER}
  Maximize Browser Window

Login to LMS
  Wait until page contains element    ${Username}
  Input Text    ${Username}    iamsaqib@gmail.com
  Input Text    ${Password}    1212
  Click Element    ${Login_Button}
  Wait Until Page Contains Element    ${Accept_Button}
  Click Element    ${Accept_Button}
  
# --- Views ------------------------------------------------------------------


# --- Content ----------------------------------------------------------------
