*** Settings ***

Library             SeleniumLibrary
Library             String
Library             OperatingSystem
Library             DateTime
Library             Collections

*** Variables ***
#Settings

${browser}                             chrome
${homepage}                            https://demo.opencart.com/

${abc}                                 abcdefghijklmnopqrstuvwxyz

#Datos para completar formulario de registro

${First Name}                          Chapulin
${Last Name}                           Colorado
${Telephone}                           987654321
${Address 1}                           La vecindad
${City}                                California
${Country}                             Argentina
${State}                               Mendoza
${Password}                            Siganmelosbuenos
${CP}                                  5501


#Locators

${My Account}                          link:My Account
${Register}                            link:Register
${Logout}                              link:Logout
${Login}                               link:Login

${Reg_Input_FstName}                   xpath://*[@id="input-firstname"]
${Reg_Input_LastName}                  xpath://*[@id="input-lastname"]
${Reg_Input_Email}                     xpath://*[@id="input-email"]
${Reg_Input_Telephone}                 xpath://*[@id="input-telephone"]
${Reg_Input_password}                  xpath://*[@id="input-password"]
${Reg_Input_confirm}                   xpath://*[@id="input-confirm"]
${Radio_Btn_newsletter}                newsletter
${Accept Terms_1}                      xpath://*[@id="content"]/form/div/div/input[1]
${Terminar Reg}                        xpath://*[@id="content"]/form/div/div/input[2]
${Login_Btn}                           xpath://*[@id="content"]/div/div[2]/div/form/input

${pagina confirmacion_Registro}        xpath://*[@id="content"]/h1
${pagina confirmacion_LogOut}          xpath://*[@id="content"]/h1


#Mensajes de confirmacion

${msj confirmacion_Registro}            Your Account Has Been Created!
${msj confirmacion_LogOut}              Account Logout