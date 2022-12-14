Narrative:
In this story you can find examples of loop steps (line 14, 24)
Also, here we use GivenStories as precondition before scenarios execution

Meta:
    @smoke

GivenStories: story/precondition/LoginInApp.story

Scenario: Put all products in the cart
Meta:
    @testCaseId 3
When I save number of elements located `className(inventory_item)` to STORY variable `productsCount`
When I find > `0` elements by `className(inventory_item)` and for each element do
|step|
|When I click on element located `buttonName(Add to cart)`|
When I change context to element located `className(shopping_cart_badge)`
Then the text '${productsCount}' exists

Scenario: Remove products from the cart
Meta:
    @testCaseId 31
When I initialize the SCENARIO variable `counter` with value `${productsCount}`
When I execute steps at most ${productsCount} times while variable 'counter' is > '0':
|step|
|When I change context to element located `className(shopping_cart_badge)`              |
|Then the text '${counter}' exists                                                      |
|When I reset context                                                                   |
|When I click on element located `xpath((//button[text()='Remove'])[1])`                |
|When I initialize the SCENARIO variable `counter` with value `#{eval(${counter} - 1)}` |
