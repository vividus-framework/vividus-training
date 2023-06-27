# VIVIDUS Training: Practice Part 8 - Final

## Write a Web Test Story

1. In your local repo switch to branch "08_task_Final" and continue your work in it.

1. Rename the `/properties/environment/saucedemo` package to the `/properties/environment/saucedemo_{yourSurname}` (e.g.  "saucedemo_Ivanov"). Then update the environment reference in the `configuration.properties` file to match the new package name.

1. Meet the following preconditions:

    - Put your scenarios into the `Task_8.story` file.

    - Put all your composite steps into the file `steps/ui_common.steps`, following the syntax rules.

    - Set up your local visual testing configuration as you did for Task 4.

1. Implement the following instructions in your scenarios:<br />

    - 4.1 In the "Navigate to the website homepage" scenario, navigate to the homepage.<br />

    - 4.2 In the "Log In" scenario, log in to the website using the "good" user, just like you did in previous tasks. <br />

    - 4.3 In the "Add items to the shopping cart " scenario:

       - a. Add the cheapest and the most expensive items to the shopping cart.

       - b. Remember that the item list may change over time, so avoid hardcoding the item names/IDs in your test.

       - c. Implement the scenario-level example table with the following parameters: sortingValue and cartBadgeCount. Make sure to use both of them in your scenario.

    - 4.4 In the "Populate checkout data" scenario, navigate to the shopping cart and populate the text fields on the /checkout-step-one.html page with randomized data generated using VIVIDUS expressions.<br />

    - 4.5 In the "Validate order summary and complete order" scenario, continue to the /checkout-step-two.html page and perform the following validations:<br />

       - a. Make sure the Subtotal price value for your cart is calculated correctly. Save prices as variables and use the #{eval()} expression to perform the calculation and comparison. <br />

       - b. Make sure the Total price value for your cart is calculated correctly. You may need to apply the #{round()} expression to the final result due to the known issue of floating-point number calculation. For details, refer to this link: https://www.baeldung.com/cs/floating-point-numbers-inaccuracy. Alternatively, you can use BigDecimal Literal in your #{eval()} expression. For details, refer to this link:  https://commons.apache.org/proper/commons-jexl/reference/syntax.html#Literals <br />

       - c. Complete the order by clicking the Finish button.<br />

    - 4.6 Add visual checks to Scenario 4 (/checkout-step-one page) and Scenario 5 (/checkout-step-two page). <br />

    - 4.7 Add validation for the "Thank you for your order!" message. However, make this validation fail by adding inaccurate text to the step. This will create a known issue entry in the `known-issues.json` file.

1. Run the resulting story on your local machine using the configuration set in the `suite.training` file. If needed, you can adjust the execution scope by modifying the `overriding.properties` file. <br />

1. Zip the second Allure report that contains the comparison result, and then upload the zipped file to the designated practical task page in the course. Your mentor will review it once you submit all the tasks.

1. Once the task is completed, make sure to commit all your local changes with commit message "{yourSurname}" to your current local branch.
