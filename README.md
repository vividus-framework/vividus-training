# VIVIDUS Training: Practice Part 7

## How To Use Expressions

1. In your local repo switch to branch "07_task_Expressions" and continue your work in it.

1. Rename the `/properties/environment/saucedemo` package to the `/properties/environment/saucedemo_{yourSurname}` (e.g.  "saucedemo_Ivanov"). Then update the environment reference in the `configuration.properties` file to match the new package name.

1. Put your scenarios into the `Task_7.story` file.

1. Implement the following instructions in your scenarios: <br />

    - 4.1 In the "Log In" scenario, log in to the website using the "good" user, just like in previous tasks. <br />

    - 4.2 In the "Add item to the shopping cart" scenario: <br />

       - a. Add at least 1 item to the shopping cart. <br />

       - b. Implement a scenario-level example table with the following parameters: `itemName`, `itemPageId`, and `addToCartButtonId`. Make sure to use all of them in your scenario. <br />

    - 4.3 In the "Populate checkout data" scenario: <br />

       - a. Navigate to the shopping cart and start the checkout process. <br />

       - b. Populate the test fields on the /checkout-step-one.html page using three different VIVIDUS expressions to generate the following data: a random name or surname, a random string of uppercase and lowercase letters, and a random postal code in the format ABC-12345. <br />

       - c. Take a screenshot as the last step of this scenario. <br />

    - 4.4 In the "Complete checkout process" scenario:

       - a. Complete the checkout process. <br />

       - b. After clicking the Finish button on the /checkout-complete.html page, save the text of the "Thank you" message to a variable. <br />

       - c. Use the #{loadResource()} VIVIDUS expression to initialize another variable that holds the contents of the message.txt file located in the /data package of your test project. <br />

       - d. Compare the two variables using the #{eval()} VIVIDUS expression along with the step "Then variable1 is comparisonRule variable2." <br />

1. Run the resulting story on your local machine using the configuration set in the suite.training file. If needed, you can adjust the execution scope by modifying the `overriding.properties` file. <br />

1. Zip the second Allure report that contains the comparison result, and then upload the zipped file to the designated practical task page in the course. Your mentor will review it once you submit all the tasks.

1. Once the task is completed, make sure to commit all your local changes with commit message "{yourSurname}" to your current local branch.
