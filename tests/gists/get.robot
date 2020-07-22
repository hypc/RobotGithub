*** Settings ***
Resource                ${EXECDIR}/tests/resources.robot
Suite Setup             Create Session    github    ${GITHUB_API_DOMAIN}
Suite Teardown          Delete All Sessions


*** Variables ***
${API_URI}              /gists


*** Test Cases ***
GET Gists Success
    ${resp}=            Get Request    github    ${API_URI}
    Request Should Be Successful    ${resp}
    Status Should Be    200    ${resp}
