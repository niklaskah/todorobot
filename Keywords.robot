*** Settings ***
Library    SeleniumLibrary
Library    Screenshot
*** Keywords ***
Login
    # Final login not iplemented, placeholder
    Run Keyword And Warn On Failure    Wait Until Element Is Visible    //button[text()="Log In"]
    Run Keyword And Warn On Failure    Click Button    //button[text()="Log In"]

Add Task
    [Arguments]    ${taskname}    ${taskdetails}
    Open New Task
    Input Task Information    ${taskname}    ${taskdetails}
    Click Button    //button[contains(text(),"Lisää")]
    Wait Until Element Is Visible    //h1[contains(text(),"Tehtävälista")]
    Run Keyword And Warn On Failure    Page Should Contain Element    //div[text()="${taskname}"]    1

Open New Task
    Wait Until Element Is Visible    //a[contains(text(),"Lisää tehtävä")]
    # Scroll Element Into View         //a[contains(text(),"Lisää tehtävä")]
    Click Element                    //a[contains(text(),"Lisää tehtävä")]

Input Task Information
    [Arguments]    ${taskname}    ${taskdetails}
    Wait Until Element Is Visible    //label[contains(text(),"Tehtävän nimi")]/following-sibling::div/input
    Input Text    //label[contains(text(),"Tehtävän nimi")]/following-sibling::div/input    ${taskname}
    Input Text    //label[contains(text(),"Tehtävän kuvaus")]/following-sibling::div/input    ${taskdetails}
    Take Screenshot

Edit Task
    [Arguments]    ${taskname}    ${taskdetails}
    Wait Until Element Is Visible    //div[text()="${taskname}"]
    Click Button    //div[text()="${taskname}"]/parent::div/following-sibling::div/a/button
    Input Task Information    ${taskname}1    ${taskdetails}1
    Click Button    //button[contains(text(),"Tallenna")]
    Wait Until Element Is Visible    //h1[contains(text(),"Tehtävälista")]
    Run Keyword And Warn On Failure    Page Should Contain Element    //div[text()="${taskname}1"]    1

Remove Task
    [Arguments]    ${taskname}
    Wait Until Element Is Visible    //div[text()="${taskname}"]
    Click Button    //div[text()="${taskname}"]/parent::div/following-sibling::div/button
    Sleep    2s
    Page Should Not Contain Element    //div[text()="${taskname}"]