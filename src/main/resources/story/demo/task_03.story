Scenario: Validate Inventory for Users
Given I am on the SauceDemo homepage
When I log in as user with username '<username>' and password '<password>'
Then page title is equal to 'Swag Labs'
Then number of elements found by xpath '//div[@class="inventory_item"]' is equal to '6'
Then I take screenshot
 
Examples:
| username               | password      |
| ${swagGoodUserName}   | ${swagPassword} |
| ${swagLockedUserName} | ${swagPassword} |
| ${swagBrokenUserName} | ${swagPassword} |
| ${swagSlowUserName}   | ${swagPassword} |