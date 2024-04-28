import { Then, When } from "@wdio/cucumber-framework";

When("Click on setting button and change password",async () => {
    const settingButton = await $('~Setting\nTab 3 of 3');

    await settingButton.click();
})

Then('I should see the setting screen', async() => {
    const settingHeader = await $("~Settings");

    await expect(settingHeader).toBeExisting();
  })

When('I click change password button', async() => {
    const changePasswordButton = await $("~Change Password");

    await changePasswordButton.click();
  })

Then('I should see the change password screen', async() => {
   const changePasswordHeader = await $(`//android.view.View[@content-desc="Change Password"]`);

   await expect(changePasswordHeader).toBeExisting();
})

Then('Click on the  change password button', () => {
    
})

When('I enter the old password {string} and new password {string}', (s: string, s2: string) => {
  // Write code here that turns the phrase above into concrete actions
})




