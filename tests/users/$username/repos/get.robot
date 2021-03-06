*** Settings ***
Resource                ${EXECDIR}/tests/resources.robot
Library                 String
Suite Setup             Create Session    github    ${GITHUB_API_DOMAIN}
Suite Teardown          Delete All Sessions


*** Variables ***
${API_URI}              /users/{username}/repos


*** Test Cases ***
GET User Repos Success
    ${url}=             Format String    ${API_URI}    username=google
    ${resp}=            Get Request    github    ${url}
    Request Should Be Successful    ${resp}
    Status Should Be    200    ${resp}

GET User Repos Failure
    ${url}=             Format String    ${API_URI}    username=not_exists_user
    ${resp}=            Get Request    github    ${url}
    Status Should Be    404    ${resp}
