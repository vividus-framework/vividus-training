Meta:
@final
 
Scenario: Navigate to the website homepage
Given Navigate to SauceDemo homepage
 
Scenario: Log In
When Log in to SauceDemo with user '${swagGoodUserName}' and password '${swagPassword}'
 
Scenario Outline: Add items to the shopping cart
When I click on element located by xpath '//select[@class="product_sort_container"]'
And I select option by value '<sortingValue>' in dropdown located by xpath '//select[@class="product_sort_container"]'
And I click on element located by xpath '(//button[contains(@id,"add-to-cart")])[1]'
And I click on element located by xpath '(//button[contains(@id,"add-to-cart")])[last()]'
Then number of elements found by xpath '//span[@class="shopping_cart_badge"]' is equal to '<cartBadgeCount>'
 
Examples:
| sortingValue | cartBadgeCount |
| lohi         | 2              |
 
Scenario: Populate checkout data
When I click on element located by xpath '//a[@class="shopping_cart_link"]'
And I click on element located by xpath '//button[@id="checkout"]'
And I input '${random.firstName}' into field with name 'first-name'
And I input '${random.string(5)}' into field with name 'last-name'
And I input '${random.pattern("[A-Z]{3}-\\d{5}")}' into field with name 'postal-code'
And I click on element located by xpath '//input[@id="continue"]'
Then I perform visual check with baseline 'checkout-step-one' and action '${baselineAction}' and acceptable diff percentage '5'
 
Scenario: Validate order summary and complete order
When I save text from element located by xpath '(//div[@class="inventory_item_price"])[1]' to variable 'price1'
And I save text from element located by xpath '(//div[@class="inventory_item_price"])[last()]' to variable 'price2'
And I initialize variable 'subtotal' with value '#{eval(price1 + price2)}'
Then I assert that element located by xpath '//div[@class="summary_subtotal_label"]' contains text '#{eval("Item total: $" + subtotal)}'
And I initialize variable 'total' with value '#{round(eval(subtotal + 2.40))}'  # Assuming fixed tax
Then I assert that element located by xpath '//div[@class="summary_total_label"]' contains text '#{eval("Total: $" + total)}'
And I perform visual check with baseline 'checkout-step-two' and action '${baselineAction}' and acceptable diff percentage '5'
And I click on element located by xpath '//button[@id="finish"]'
Then I assert that text from element located by xpath '//h2' is equal to 'Thank you for placing an order!'  # Intentional failure
 