# VIVIDUS Training: Practice Part 5

## Manage Known Issues

1. In your local repo switch to branch "05_task_Known_Issues" and continue your work in it.

1. Rename the `/properties/environment/saucedemo` package to the `/properties/environment/saucedemo_{yourSurname}` (e.g.  "saucedemo_Ivanov"). Then update the environment reference in the `configuration.properties` file to match the new package name.

1. Meet the following preconditions:

    - Put your scenarios into the `Task_5.story` file.

    - Use the existing `known-issues.json` file to store your patterns.

1. Define two known issue entries for your existing test script from Task 3/4. Here's what you should do:

    - 4.1 Make sure your test script validates the following:

       - The user logs in and navigates to the /inventory.html page.

       - Six inventory items are displayed on the /inventory.html page.

    - 4.2 Replace the "good" user with a "locked" user and rerun your script.

    - 4.3 Review the resulting Allure report. The validations mentioned in Item 4.1 should fail because the "locked" user cannot go beyond the login screen.

    - 4.4 Create two entries in the `known-issues.json` file labeled "BUG-001" and "BUG-002" to mark the above failures as "known issues" in the report.

1. Rerun the story as a "locked" user and ensure that there are no failed (red-colored) test cases in the Allure report this time.

1. Zip the second Allure report, which contains the known issues marked accordingly, and then upload the zipped file to the designated practical task page in the course. Your mentor will review it once you submit all the tasks.

1. Once the task is completed, make sure to commit all your local changes with commit message "{yourSurname}" to your current local branch.
