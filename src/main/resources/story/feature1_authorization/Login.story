Narrative:
This story designed to validate web site with 'vividus-plugin-web-app'
Here you can find examples of usage different types of locators supported by VIVIDUS
Usage of GLOBAL variables from property files
Scenario level examples table for parametrized scenario execution

Scenario: Login successfull
Meta:
    @testCaseId 1
    @smoke
Given I am on the main application page
When I enter `${default-user}` in field located `id(user-name)`
When I enter `${default-user-password}` in field located `id(password)`
When I click on element located `buttonName(login-button)`
Then number of elements found by `id(shopping_cart_container)` is = `1`

Scenario: Login unsuccessfull
Meta:
    @testCaseId 2
    @regression
Given I am on the main application page
When I enter `<username>` in field located `id(user-name)`
When I enter `<password>` in field located `id(password)`
When I click on element located `buttonName(login-button)`
When I wait until element located `className(error-message-container)` appears
When I change context to element located `className(error-message-container)`
Then the text 'Epic sadface: <expected_error>' exists
Examples:
|username        |password     |expected_error                                                            |
|unexisted-user  |secret_sauce |Username and password do not match any user in this service |
|${default-user} |123321asda   |Username and password do not match any user in this service |
|${default-user} |             |Password is required                                        |
|locked_out_user |secret_sauce |Sorry, this user has been locked out.                       |
