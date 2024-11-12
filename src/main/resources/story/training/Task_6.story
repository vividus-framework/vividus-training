Meta:
    @group Training
    @requirementId MyTask-0006

Lifecycle:
Examples:
|userName             |password       |
|${swagGoodUserName} |${swagPassword}|
|${swagSlowUserName}|${swagPassword}|

Scenario: Navigate to the website homepage
When I open main application page


Scenario: Log In
When I enter  `<userName>` in field located by `id(user-name)`
When I enter  `<password>` in field located by `id(password)`
When I click on element located by `id(login-button)`
Then `${current-page-url}` is equal to `https://www.saucedemo.com/inventory.html`


Scenario: Add item to the shopping cart
When I click on element located by `id(item_<item>_title_link)`
Then the page with the URL containing '<itemPageId>' is loaded
When I click on element located by `By.id(<addToCartButtonId>)`
Examples:
|addToCartButtonId	                     |itemName               /itemPageId               |item|
|add-to-cart-sauce-Sauce-labs-bike-light|Sauce Labs Bike Light  //inventory-item.html?id=0|0   |
|add-to-cart-sauce-labs-bolt-t-shirt   |Sauce Labs Bolt T-Shirt//inventory-item.html?id=1|1   |
|add-to-cart-sauce-labs-onesie        |Sauce Labs Onesie      //inventory-item.html?id=2|2   |


Scenario: Validate the num of items in the shopping cart
Then number of elements found by `By.xpath(//span[contains(@class,'badge') and contains(text(),3)])` is equal to `1`


Scenario: Log Out
When I click on element located by `id(react-burger-menu-btn)`
When I click on element located by `id(reset_sidebar_link)`
When I click on element located by `id(logout_sidebar_link)`
Then `${current-page-url}` is equal to `https://www.saucedemo.com/`
