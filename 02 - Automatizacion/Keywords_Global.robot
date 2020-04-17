*** Settings ***

Library             SeleniumLibrary
Library             String
Library             OperatingSystem
Library             DateTime
Library             Collections

Resource            Resources.robot

*** Keywords ***

Suite setup esp
    Set Screenshot Directory                              Screenshot
    Generate Email
    Set Selenium Speed        0.2
    Set Selenium Timeout      10.0
    Open homepage             1250                         900

Generate Email_New
    ${Usuario}         Generate Random String               6                       ${abc}
    ${Email_New}    Catenate    SEPARATOR=      ${Usuario}     @chipote.com
    Set Global Variable    ${Email_New}

Generate Email
    ${texto}    Get File    Email/email.txt
    @{lista}    Split String    ${texto}
    ${Email}    Get From List            ${lista}       -1
    Set Global Variable    ${Email}

Save Email_New
    ${date}            Get Current Date
    ${file}            Catenate              ${date}\n         ${Email_New}
    Append To File     Email/email.txt       ${file}\n


Teardown espc
    ${Cant_Email_New}        Get Length         ${Email_New}
    Run Keyword If     ${Cant_Email_New}>0           Save Email_New
    Close All Browsers

Open homepage
    [Arguments]    ${width}   ${height}
    Open browser    ${homepage}   ${browser}
    Set Window Size    ${width}    ${height}

Go To Homepage
    Go To    ${homepage}
    Wait Until Element Is Visible       ${Logo Homepage}


#Test Case 001
Registrar nuevo Usuario
   [Arguments]                          ${R_Btn_newsletter}
                                         #Argumento=0 "no registra a Newsletter"
                                         #Argumento=1 "Registra a Newsletter"

    Click Element                       ${My Account}
    Click Element                       ${Register}

    Input Text                          ${Reg_Input_FstName}                     ${First Name}
    Input Text                          ${Reg_Input_LastName}                    ${Last Name}
    Input Text                          ${Reg_Input_Email}                       ${Email_New}
    Input Text                          ${Reg_Input_Telephone}                   ${Telephone}
    Input Text                          ${Reg_Input_password}                    ${Password}
    Input Text                          ${Reg_Input_confirm}                     ${Password}
    Select Radio Button                 ${Radio_Btn_newsletter}                  ${R_Btn_newsletter}
    Select Checkbox                     ${Accept Terms_1}
    Click Element                       ${Terminar Reg}

#Verifica que el registro de nuevo usuario haya sido exitoso
Verificar registro
    Wait Until Element Is Visible       ${pagina confirmacion_1}
    Element Should Contain              ${pagina confirmacion_1}               ${msj confirmacion_1}

Log Out
    Click Link                          ${My Account}
    Click Link                          ${Logout}


Log In
    Click Link                          ${My Account}
    Click Link                          ${Login}

    Wait Until Element Is Visible       ${Reg_Input_Email}
    Input Text                          ${Reg_Input_Email}                           ${Email}
    Input Text                          ${Reg_Input_password}                        ${Password}
    Click Element                       ${Login_Btn}


Verificar login
    Element Should Contain              ${pagina confirmacion_2}                      ${msj confirmacion_2}

#Verifica si hay un ususrio logueado-Si es asi realiza el LogOut
Check Login
    Click Link                              ${My Account}
    ${count}          Get Element Count                  ${Login}
    Run Keyword If                          ${count}==0         Log Out       ELSE       Click Link                              ${My Account}




#Seleccionar articulo para comprar
Select article

    Mouse Over                           ${Lista_articulos}
    Click Element                        ${gral_Laptops}

    Wait Until Element Is Visible        ${Logo Homepage}
    Click Element                        ${Articulo_1}

    Wait Until Element Is Visible        ${Logo Homepage}
    ${texto}    Get Text                 ${titulo_articulo}
    Clear Element Text                   ${box_cant_art}
    Input Text                           ${box_cant_art}           2
    Click Element                        ${btn_add_art}
    Click Element                        ${Btn_Shop_Cart}
    Set Global Variable                  ${texto}


Verificar articulo en carrito
    Wait Until Element Is Visible        ${box_cant_carrito}
    Element Should Contain               ${Articulo_1}               ${texto}

Cambiar cantidad en carrito
    Clear Element Text                   ${box_cant_carrito}
    Input Text                           ${box_cant_carrito}         1
    Click Element                        ${btn_refresh_carrito}
    Sleep    2.0
    Textfield Value Should Be            ${box_cant_carrito}         1

Estimate Shipping & Taxes

    Click Element                        ${acordion_shipping}

    Select From List By Label            ${lista_country}         ${Country}
    Sleep                                2.0
    Select From List By Label            ${lista_zone}            ${State}
    Input Text                           ${input_CP}              ${CP}
    CLick Element                        ${btn_get quote}
    Sleep                                5.0
    Select Radio Button                  ${Radio_Btn_shipping_method}                        ${Radio_Btn_shipping_select}
    CLick Element                        ${btn_apply shipping}
    Sleep                                5.0
    Click Link                           ${btn_checkout}

Revisar direccion
     Sleep      3.0
     ${radio}       Get Element Count           payment_address
     Run Keyword If         ${radio}>0            Select Radio Button    payment_address    new


Checkout

    Wait Until Element Is Visible        ${Payment_Input_FstName}
    Input Text                           ${Payment_Input_FstName}       ${First Name}
    Input Text                           ${Payment_Input_LastName}      ${Last Name}
    Input Text                           ${Payment_Input_Address-1}     ${Adress 1}
    Input Text                           ${Payment_Input_City}          ${City}
    Input Text                           ${Payment_Input_CP}            ${CP}
    Select From List By Label            ${Payment_Input_Country}       ${Country}
    Sleep                                2.0
    CLick Element                        ${Payment_Input_Zone}
    Select From List By Label            ${Payment_Input_Zone}          ${State}
    CLick Element                        ${btn_payment_continue}
    Sleep                                5.0

    Select Radio Button                  ${Radio_Btn_shipping_address}              ${Radio_Btn_shipping_address_sel}
    CLick Element                        ${btn_shipping_continue}
    Sleep                                3.0

    Input Text                           ${Textarea_shipping_Method}        ${Email}
    CLick Element                        ${btn_ship_Method_continue}
    Sleep                                3.0

    Select Checkbox                      ${Accept Terms_2}
    CLick Element                        ${btn_Pay_Method_continue}
    Sleep                                5.0

    CLick Element                        ${btn_confirm_order}

Confirmar compra

    Wait Until Element Is Visible        ${pagina confirmacion_3}
    Sleep                                3.0
    Page Should Contain                  ${msj confirmacion_3}

