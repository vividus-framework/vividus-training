Scenario: Login validation with locked user
Given I navigate to '${web-application.main-page-url}'
And I input '${swagLockedUserName}' into field with name 'user-name'
And I input '${swagPassword}' into field with name 'password'
And I click on element located by xpath '//input[@id="login-button"]'
Then page title is equal to 'Swag Labs'
Then number of elements found by xpath '//div[@class="inventory_item"]' is equal to '6'