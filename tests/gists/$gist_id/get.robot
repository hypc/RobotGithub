*** Settings ***
Resource                ${EXECDIR}/tests/resources.robot
Library                 String
Suite Setup             Create Session    github    ${GITHUB_API_DOMAIN}
Suite Teardown          Delete All Sessions


*** Variables ***
${API_URI}              /gists/{gist_id}


*** Test Cases ***
GET Gist Success
    ${url}=             Format String    ${API_URI}    gist_id=547b7464fbcf02052b6840bcbc6b8b94
    ${resp}=            Get Request    github    ${url}
    Request Should Be Successful    ${resp}
    Status Should Be    200    ${resp}

GET Gist Failure
    ${url}=             Format String    ${API_URI}    gist_id=none
    ${resp}=            Get Request    github    ${url}
    Status Should Be    404    ${resp}
