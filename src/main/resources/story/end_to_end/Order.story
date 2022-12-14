Meta:
    @testCaseId 13
    @e2e

GivenStories: story/precondition/LoginInApp.story

Scenario: Add Sauce-labs backpack into cart
When I click on element located `buttonName(add-to-cart-sauce-labs-backpack)`
When I change context to element located `className(shopping_cart_badge)`
Then the text '1' exists
When I reset context

Scenario: Validate cart
When I click on element located `className(shopping_cart_link)`
Then number of elements found by `className(cart_item)` is = `1`
When I change context to element located `className(cart_item)`
Then the text 'Sauce Labs Backpack' exists
Then the text '$29.99' exists
Then number of elements found by `buttonName(Remove)` is = `1`
When I reset context

Scenario: Validate checkout info
When I click on element located `buttonName(Checkout)`
When I wait until element located `id(checkout_info_container)` appears
Then number of elements found by `caseInsensitiveText(checkout: your information)` is = `1`
When I enter `#{generate(Name.firstName)}` in field located `id(first-name)`
When I enter `#{generate(Name.lastName)}` in field located `id(last-name)`
When I enter `#{generate(Address.zipCode)}` in field located `id(postal-code)`

Scenario: Validate checkout price
When I click on element located `buttonName(Continue)`
Then number of elements found by `caseInsensitiveText(Checkout: Overview)` is = `1`
Then number of elements found by `className(cart_item)` is = `1`
When I change context to element located `className(summary_subtotal_label)`
When I save text of context element to SCENARIO variable `${productsPriceText}`
When I initialize the SCENARIO variable `productsPrice` with value `#{replaceFirstByRegExp(Item total:\s\$(\d+.?\d*), $1, ${productsPriceText})}`
When I change context to element located `className(summary_tax_label)`
When I save text of context element to SCENARIO variable `${taxText}`
When I initialize the SCENARIO variable `productsPrice` with value `#{replaceFirstByRegExp(Tax:\s\$(\d+.?\d*), $1, "${productsTax})}`
When I initialize the SCENARIO variable `expecteTotalPrice` with value `#{eval(${productsPrice} + ${productsTax})}`
When I change context to element located `className(summary_total_label)`
Then the text 'Total: ${currency}${expecteTotalPrice}' exists
When I reset context

Scenario: Validate success order
When I click on element located `buttonName(Finish)`
Then number of elements found by `caseInsensitiveText(CHECKOUT: COMPLETE!)` is = `1`
Then the text 'THANK YOU FOR YOUR ORDER' exists

Scenario: Validate Back Home button
When I click on element located `buttonName(Back Home)`
When I wait until element located `className(shopping_cart_container)` appears
Then number of elements found by `className(shopping_cart_badge)` is = `0`
