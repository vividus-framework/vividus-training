Scenario: Visual Validation for Users
Given I am on the SauceDemo homepage
When I log in as user with username '<username>' and password '<password>'
Then page title is equal to 'Swag Labs'
 
Examples:
| username               | password        |
| ${swagGoodUserName}   | ${swagPassword} |
| ${swagBrokenUserName} | ${swagPassword} |