import { Given, Then, When } from "@wdio/cucumber-framework";
import { expect, $ } from "@wdio/globals";

Given('I am on the register screen', async () => {
    const button = await $("~Create your account.");
    const registerHeader = await $("~Register");

    await expect(button).toBeExisting();
    await button.click();
    await expect(registerHeader).toBeExisting();
})

When('I register with username {string} email {string} and password {string}', async (userName: string, email: string, password: string) => {

    const userNameTextBox = await $("//android.widget.FrameLayout[@resource-id=\"android:id/content\"]/android.widget.FrameLayout/android.view.View/android.view.View/android.view.View/android.view.View/android.widget.EditText[1]");
    const emailTextBox = await $("//android.widget.FrameLayout[@resource-id=\"android:id/content\"]/android.widget.FrameLayout/android.view.View/android.view.View/android.view.View/android.view.View/android.widget.EditText[2]");
    const passwordTextBox = await $("//android.widget.FrameLayout[@resource-id=\"android:id/content\"]/android.widget.FrameLayout/android.view.View/android.view.View/android.view.View/android.view.View/android.widget.EditText[3]");
    const confirmPasswordTextBox = await $("//android.widget.FrameLayout[@resource-id=\"android:id/content\"]/android.widget.FrameLayout/android.view.View/android.view.View/android.view.View/android.view.View/android.widget.EditText[4]");
    const registerButton = await $("~Sign Up");


    await userNameTextBox.click();
    await userNameTextBox.setValue(userName);
    await emailTextBox.click();
    await emailTextBox.setValue(email);
    await passwordTextBox.click();
    await passwordTextBox.setValue(password);
    await confirmPasswordTextBox.click();
    await confirmPasswordTextBox.setValue(password);
    await registerButton.click();
})

Then('I should register success', async () => {
    const loginHeader = await $("~Login");

    await expect(loginHeader).toBeExisting();
})
  