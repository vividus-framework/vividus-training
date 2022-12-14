Meta:
    @smoke
    @regression

Scenario: Login in the web application
Given I am on the main application page
When I login in the web application with `${default-user}` and `${default-user-password}`
