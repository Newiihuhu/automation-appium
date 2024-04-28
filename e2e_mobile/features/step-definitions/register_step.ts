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
  