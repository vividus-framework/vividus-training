Narrative:
This story is designed to show known-issues mechanism
Known-issue described as VVD-1 in known-issues.json file
You can additionally play with `failScenarioFast` and `failStoryFast` parameters to see how they affect story execution

Meta:
    @regression

GivenStories: story/precondition/LoginInApp.story

Scenario: With known issue - Put 2 products in the cart and clean it
Meta:
    @testCaseId 23
Then number of elements found by `buttonName(Remove)` is = `0`
When I click on element located `buttonName(add-to-cart-sauce-labs-backpack)`
When I click on element located `buttonName(add-to-cart-sauce-labs-fleece-jacket)`
Then number of elements found by `buttonName(Remove)` is = `2`
When I click on element located `buttonName(react-burger-menu-btn)`
When I wait until element located `linkText(Reset App State)` appears
When I click on element located `linkText(Reset App State)`
Then number of elements found by `buttonName(Remove)` is = `0`
Then number of elements found by `className(shopping_cart_badge)` is = `0`

Scenario: Put products in the cart and remove from it
Meta:
    @testCaseId 24
When I click on element located `buttonName(add-to-cart-sauce-labs-onesie)`
Then number of elements found by `className(shopping_cart_badge)` is = `1`
When I click on element located `buttonName(remove-sauce-labs-onesie)`
Then number of elements found by `className(shopping_cart_badge)` is = `0`
