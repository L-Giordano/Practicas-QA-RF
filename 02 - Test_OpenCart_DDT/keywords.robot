*** Settings ***

Resource    resources.robot

*** Keywords ***

Initialize Sys
    Set Screenshot Directory          /Screenshot
    Set Selenium Timeout              10
    Set Selenium Speed                0.2
    Open browser                ${Home_URL}             ${Browser}
    Maximize Browser Window
    Go to Log In page

Go to Homepage
    Go to                       ${Home_URL}

Go to Log In page
    Click Link                  ${My Account}
    Click Link                  ${Login}

Input User Name
    [Arguments]         ${User}
    Input Text                  ${Reg_Input_Email}             ${User}

Input User Password
    [Arguments]         ${Password}
    Input Text                  ${Reg_Input_password}          ${Password}

Submit credentials
    Click Element               ${Login_Btn}

Error message Should Be show

    Element Should Contain       ${Error_element}    ${Error_msg}

Log Out
    Click Link                          ${My Account}
    Click Link                          ${Logout}
