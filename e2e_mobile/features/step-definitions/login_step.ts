import { Given, Then, When } from "@wdio/cucumber-framework";
import { expect, $ } from "@wdio/globals";

Given("I am on the login screen", async () => {
  const loginHeader = await $("~Login");

  await expect(loginHeader).toBeExisting();
});

When(
  "I login with email {string} and password {string}",
  async (email: string, password: string) => {
    const emailTextBox = await $(
      "/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.view.View/android.view.View/android.view.View/android.view.View/android.widget.EditText[1]"
    );
    const passwordTextBox = await $(
      "/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.view.View/android.view.View/android.view.View/android.view.View/android.widget.EditText[2]"
    );
    const loginButton = await $("~LOGIN");

    await emailTextBox.click();
    await emailTextBox.setValue(email);

    await passwordTextBox.click();
    await passwordTextBox.setValue(password);

    await loginButton.click();
  }
);

Then("I should see dashboard screen", async () => {
  const dashboardTitle = await $(
    "~Which brand of water\nwould you like to buy?"
  );

  await expect(dashboardTitle).toBeExisting();
});
