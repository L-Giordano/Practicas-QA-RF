*** Settings ***

Library             SeleniumLibrary


*** Variables ***

#Settings

${Browser}                chrome
${Home_URL}                    https://demo.opencart.com/

#Credenciales

${Invalid_User}                 123@chipote.com
${Invalid_Pw}                   Invalid
${Valid User}                   onsera@chipote.com
${Valid_Pw}                     Siganmelosbuenos


#Locators

${My Account}                          link:My Account
${Login}                               link:Login

${Reg_Input_Email}                     xpath://*[@id="input-email"]
${Reg_Input_password}                  xpath://*[@id="input-password"]
${Login_Btn}                           xpath://*[@id="content"]/div/div[2]/div/form/input

${Error_element}                       xpath://*[@id="account-login"]/div[1]
${Error_msg}                           Warning: No match for E-Mail Address and/or Password.

${Logout}                              link:Logout


