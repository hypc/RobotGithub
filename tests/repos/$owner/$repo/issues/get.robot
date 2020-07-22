*** Settings ***
Resource                ${EXECDIR}/tests/resources.robot
Library                 String
Suite Setup             Create Session    github    ${GITHUB_API_DOMAIN}
Suite Teardown          Delete All Sessions


*** Variables ***
${API_URI}              /repos/{owner}/{repo}/issues


*** Test Cases ***
GET Repo Issues Success
    ${url}=             Format String    ${API_URI}    owner=google    repo=jax
    ${resp}=            Get Request    github    ${url}
    Request Should Be Successful    ${resp}
    Status Should Be    200    ${resp}

GET Repo Issues Failure
    ${url}=             Format String    ${API_URI}    owner=not_exists_user    repo=none
    ${resp}=            Get Request    github    ${url}
    Status Should Be    404    ${resp}
