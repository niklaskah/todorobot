*** Settings ***
Library  SeleniumLibrary
Resource  Keywords.robot
Suite Setup     Open Browser    ${URL}   ${BROWSER}
Suite Teardown  Close All Browsers


*** Variables ***
${URL}              https://todo-4f5wlwv2a-niklaskah.vercel.app/tasks
${BROWSER}          firefox
${TASK_NAME}        testi
${TASK_DETAIL}      testi

*** Test Cases ***
Test Task List Functionality
    Set Selenium Speed    1
    Login
    Add Task        ${TASK_NAME}    ${TASK_DETAIL}
    Edit Task       ${TASK_NAME}    ${TASK_DETAIL}
    Remove Task     ${TASK_NAME}1