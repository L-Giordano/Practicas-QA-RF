*** Settings ***

Resource            Resources.robot

*** Keywords ***

Inicializar sistema p/pruebas
    Set Screenshot Directory                              Screenshot
    Set Selenium Speed                                    0.2
    Set Selenium Timeout                                  10.0
    Generar Email p/Nuevo registro
    Salvar Email_Nw_Rg
    Buscar Email p/Login
    Open browser                     ${homepage}   ${browser}


#Keywordrs para la inicializacion

Generar Email p/Nuevo registro
    ${Usuario}         Generate Random String               6                       ${abc}
    ${Email_Nw_Rg}       Catenate        SEPARATOR=      ${Usuario}     @chipote.com
    Set Global Variable    ${Email_Nw_Rg}

Buscar Email p/Login
    ${texto}    Get File    Email/email.txt
    @{lista}    Split String    ${texto}
    ${Email}    Get From List            ${lista}       -1
    Set Global Variable    ${Email}

Salvar Email_Nw_Rg
    ${date}            Get Current Date
    ${file}            Catenate              ${date}\n         ${Email_Nw_Rg}
    Append To File     Email/email.txt       ${file}\n


Teardown espc
    Close All Browsers



#Keywordrs para Test Cases

Ir a pagina de registro
    Click Element                       ${My Account}
    Click Element                       ${Register}

Registrar nuevo Usuario

    Input Text                          ${Reg_Input_FstName}                     ${First Name}
    Input Text                          ${Reg_Input_LastName}                    ${Last Name}
    Input Text                          ${Reg_Input_Email}                       ${Email_Nw_Rg}
    Input Text                          ${Reg_Input_Telephone}                   ${Telephone}
    Input Text                          ${Reg_Input_password}                    ${Password}
    Input Text                          ${Reg_Input_confirm}                     ${Password}
    Select Checkbox                     ${Accept Terms_1}
    Click Element                       ${Terminar Reg}

Verificar registro exitoso
    Wait Until Element Is Visible       ${pagina confirmacion_Registro}
    Element Should Contain              ${pagina confirmacion_Registro}        ${msj confirmacion_Registro}


Log Out
    Click Link                          ${My Account}
    Click Link                          ${Logout}

Verificar Logout exitoso
    Wait Until Element Is Visible       ${pagina confirmacion_LogOut}
    Element Should Contain              ${pagina confirmacion_LogOut}          ${msj confirmacion_LogOut}


Ir a pagina de Log In
    Click Link                          ${My Account}
    Click Link                          ${Login}

Realizar Log In
    Wait Until Element Is Visible       ${Reg_Input_Email}
    Input Text                          ${Reg_Input_Email}                      ${Email}
    Input Text                          ${Reg_Input_password}                   ${Password}
    Click Element                       ${Login_Btn}

Verificar login
    ${zero}     Convert To Integer     0
    Click Link                          ${My Account}
    ${count}                            Get Element Count                     ${Login}
    Should Be Equal                     ${count}                              ${zero}


