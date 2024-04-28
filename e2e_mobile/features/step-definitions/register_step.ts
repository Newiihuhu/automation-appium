import { Given, Then, When } from "@wdio/cucumber-framework";
import { expect, $ } from "@wdio/globals";

When('I click create your account', async () => {
    const button = await $("~Create your account.");

    await expect(button).toBeExisting();
    await button.click();
})

Then('I should see register screen', async () => {
    const registerHeader = await $("~Register");
    await expect(registerHeader).toBeExisting();
})

// Given('I am on the register screen', async () => {
//     const registerHeader = await $("~Register");

//     await expect(registerHeader).toBeExisting();
// })

// When('I fill all fields with username {string} email {string} and password {string}', async (s: string, s2: string, s3: string) => {

//     const userNameTextBox = await $("//android.widget.FrameLayout[@resource-id=\"android:id/content\"]/android.widget.FrameLayout/android.view.View/android.view.View/android.view.View/android.view.View/android.widget.EditText[1]");
//     const emailTextBox = await $("//android.widget.FrameLayout[@resource-id=\"android:id/content\"]/android.widget.FrameLayout/android.view.View/android.view.View/android.view.View/android.view.View/android.widget.EditText[2]");
//     const passwordTextBox = await $("//android.widget.FrameLayout[@resource-id=\"android:id/content\"]/android.widget.FrameLayout/android.view.View/android.view.View/android.view.View/android.view.View/android.widget.EditText[3]");
//     const confirmPasswordTextBox = await $("//android.widget.FrameLayout[@resource-id=\"android:id/content\"]/android.widget.FrameLayout/android.view.View/android.view.View/android.view.View/android.view.View/android.widget.EditText[4]");

// await userNameTextBox.click();
// await userNameTextBox.setValue("testtest");
// await emailTextBox.click();
// })
  