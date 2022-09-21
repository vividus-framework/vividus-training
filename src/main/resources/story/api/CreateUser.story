Narrative:
This story is designed to validate REST web-service with 'vividus-plugin-rest-api'
VIVIDUS features:
line 15: set-up request body for further POST request (line 17) with GLOBAL variables,
placed in the accounts.properties file
line 23: save element value from response as STORY variable to use in next scenarios
line 33: add request header with token from the previous scenario
line 40: examples table values from external .table file
line 46: request with dynamic query parameters, generated as combination of examples table values and STORY variable

Meta:
    @api
    @testCaseId 6

Scenario: Get token
Given request body:
{
    "email": "${api-admin-user}",
    "password": "${api-admin-user-password}"
}
When I send HTTP POST to the relative URL '/login'
Then `${responseCode}` is equal to `200`
When I save JSON element value from context by JSON path `$.token` to STORY variable `loginToken`

Scenario: Create Users
When I add request headers:
|name       |value         |
|Auth-token |${loginToken} |
Given request body:
{
    "firstName" : "<first_name>",
    "lastName" : "<last_name>",
    "email" : "<email>",
    "birthday" : "<birthday>"
}
When I send HTTP POST to the relative URL '/users'
Then `${responseCode}` is equal to `201`
When I save JSON element value from context by JSON path `$.id` to STORY variable `<first_name>.<last_name>Id`
Examples:
story/testdata/users.table

Scenario: Delete Users
When I add request headers:
|name       |value         |
|Auth-token |${loginToken} |
When I send HTTP DELETE to the relative URL '/users/${<first_name>.<last_name>Id}'
Then `${responseCode}` is equal to `204`
Then the response does not contain body
Examples:
story/testdata/users.table
