
Scenario: 4.1,4.2,4.3 Add items to the shopping cart
When Navigate to the SauceDemo website homepage
When I fill ${swagGoodUserName},${swagPassword} to saucedemo website
When I save text of element located by `xpath(.//*[@data-test="inventory-item-price"])->filter.index(1)` to scenario variable `min`
When I save text of element located by `xpath(.//*[@data-test="inventory-item-price"])->filter.index(1)` to scenario variable `max`
Given I initialize SCENARIO variable `min` with value `#{substringAfter(${min}, $)}`
Given I initialize SCENARIO variable `max` with value `#{substringAfter(${max}, $)}`
When I find GREATER_THAN `0` elements by `xpath(//*[@data-test="inventory-item"])` and for each element do
|step|
|When I save text of element located by `xpath(.//*[@data-test="inventory-item-price"])` to scenario variable `price`|
|Given I initialize SCENARIO variable `cleanPrice` with value `#{substringAfter(${price}, $)}`                       |
|Given I initialize SCENARIO variable `min` with value `#{eval(${cleanPrice} < ${min} ? ${cleanPrice} : ${min})}`    |
|Given I initialize SCENARIO variable `max` with value `#{eval(${cleanPrice} > ${max} ? ${cleanPrice} : ${max})}`    |                                                                  |
When I click on element located by `xpath(.//*[text()[contains(.,"${min}")]]//parent::div//button)` 
When I click on element located by `xpath(.//*[text()[contains(.,"${max}")]]//parent::div//button)` 
When I save text of element located by `xpath(.//*[@class="shopping_cart_badge"])` to scenario variable `itemCount`
Then `${itemCount}` is equal to `<items>`
Then `${min}` is equal to `<minPrice>`
Then `${max}` is equal to `<maxPrice>`
When reset the application and  logout


Examples:
|minPrice |maxPrice  |items|
|7.99     |    49.99 |2     |


Scenario: 4.4,4.5,4.6,4.7 Populate checkout data
When Navigate to the SauceDemo website homepage
When I fill ${swagGoodUserName},${swagPassword} to saucedemo website

When I save text of element located by `xpath(.//*[@data-test="inventory-item-price"])->filter.index(1)` to scenario variable `min`
When I save text of element located by `xpath(.//*[@data-test="inventory-item-price"])->filter.index(1)` to scenario variable `max`
Given I initialize SCENARIO variable `min` with value `#{substringAfter(${min}, $)}`
Given I initialize SCENARIO variable `max` with value `#{substringAfter(${max}, $)}`
When I find GREATER_THAN `0` elements by `xpath(//*[@data-test="inventory-item"])` and for each element do
|step|
|When I save text of element located by `xpath(.//*[@data-test="inventory-item-price"])` to scenario variable `price`|
|Given I initialize SCENARIO variable `cleanPrice` with value `#{substringAfter(${price}, $)}`                       |
|Given I initialize SCENARIO variable `min` with value `#{eval(${cleanPrice} < ${min} ? ${cleanPrice} : ${min})}`    |
|Given I initialize SCENARIO variable `max` with value `#{eval(${cleanPrice} > ${max} ? ${cleanPrice} : ${max})}`    |                                                                  |
When I click on element located by `xpath(.//*[text()[contains(.,"${min}")]]//parent::div//button)` 
When I click on element located by `xpath(.//*[text()[contains(.,"${max}")]]//parent::div//button)` 

When I click on element located by `linkText(shopping-cart-link)`
When I click on element located by `id(checkout)`
Then `${current-page-url}` is equal to `https://www.saucedemo.com/checkout-step-one.html`
When I take screenshot
When I COMPARE_AGAINST baseline with name `checkoutstepone` ignoring:
|ELEMENT                                   |ACCEPTABLE_DIFF_PERCENTAGE|
|By.xpath(//*[@id='continue'])             |46.020                   |

When I fill firstname,lastname and postal code

When I click on element located by `id(continue)`
Then `${current-page-url}` is equal to `https://www.saucedemo.com/checkout-step-two.html`
When I COMPARE_AGAINST baseline with name `checkoutpage` ignoring:
|ELEMENT                                   |ACCEPTABLE_DIFF_PERCENTAGE|
|By.xpath(//*[@id='continue'])             |5                   |

When I save text of element located by `xpath(//*[text()[contains(.,'total')]]/text()[contains(.,"total")]/..)` to scenario variable `subtotal`
Given I initialize SCENARIO variable `subtotal` with value `#{substringAfter(${subtotal}, $)}`
When I save `innerHTML` attribute value of element located by `xpath(//*[@data-test="subtotal-label"])` to scenario variable `total`      
Given I initialize SCENARIO variable `subtotal` with value `#{round(${subtotal}, 2)}` 
Given I initialize SCENARIO variable `expectedsubtotal` with value `#{eval(${min}+${max})}` 
Given I initialize SCENARIO variable `expectedsubtotal` with value `#{round(${expectedsubtotal}, 2)}` 
Then `eval(${subtotal})` is = `eval(${expectedsubtotal})`

When I click on element located by `id(finish)`
When I save text of element located by `tagName(h2)` to scenario variable `text`
Then `${text}` is equal to `Thank you for you order!`
