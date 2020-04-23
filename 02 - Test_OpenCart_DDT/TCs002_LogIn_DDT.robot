*** settings ***

Resource              keywords.robot

Suite Setup           Initialize Sys
Suite Teardown        Close All Browsers
Test Template         Login Invalid Credentials

*** Test Cases ***                       User                 Password

Valid User Empty Password             ${Valid User}          ${Empty}
Valid User Invalid Password           ${Valid User}          ${Invalid_Pw}
Invalid User Empty Password           ${Invalid_User}        ${Empty}
InValid User Invalid Password         ${Invalid_User}        ${Invalid_Pw}
Empty User Empty Password             ${Empty}               ${Empty}

*** keywords ***

Login Invalid Credentials
    [Arguments]     ${User}     ${Password}
    Input User Name             ${User}
    Input User Password         ${Password}
    Submit credentials
    Error message Should Be show
