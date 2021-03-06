*** Keywords ***
Send GET request
    [Arguments]         ${url}      ${expected_status}=200
    [Documentation]     Sends a GET request and asserts the statuscode for status 200. Returns the response in JSON.
    REST.GET            ${url}
    ${output}=          output
    # Make a variable at test level so it is accessible for the function 'get_last_output_message'
    set test variable   ${output}   ${output}
    assert dictionary   ${output}   {"status":${expected_status}}   
    ${response}=        output      response body
    [Return]            ${response}

Send POST request
    [Arguments]         ${url}       ${body}        ${expected_status}=201
    [Documentation]     Sends a POST request and asserts the statuscode for status 201. Returns the response in JSON.
    REST.POST           ${url}       ${body}
    ${output}=          output
    # Make a variable at test level so it is accessible for the function 'get_last_output_message'
    set test variable   ${output}    ${output}
    assert dictionary   ${output}    {"status":${expected_status}}
    ${response}=        output       response body      
    [Return]            ${response}

Send DELETE request
    [Arguments]         ${url}      ${expected_status}=200
    [Documentation]     Sends a DELETE request and asserts the statuscode for status 200. Returns the response in JSON.
    REST.DELETE         ${url}      
    ${output}=          output
    # Make a variable at test level so it is accessible for the function 'get_last_output_message'
    set test variable   ${output}   ${output}
    assert dictionary   ${output}   {"status":${expected_status}}
    ${response}=        output      response body      
    [Return]            ${response}