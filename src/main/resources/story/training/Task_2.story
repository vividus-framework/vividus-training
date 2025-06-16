GivenStories: story/demo/Homepage_Demo.story

Scenario: Log in as a Good User
When I enter `${swagGoodUserName}` in field located by `id(user-name)`
When I enter `${swagPassword}` in field located by `id(password)`
When I click on element located by `xpath(//input[@id='login-button'])`
Then number of elements found by `xpath(//*[@class='inventory_item_name'])` is equal to `6`
When I take screenshot