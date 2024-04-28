import { Given, Then, When } from "@wdio/cucumber-framework";
import { expect, $ } from "@wdio/globals";

When("I input searh text field {string}", async (search: string) => {
  const searhInputText = await $("//android.widget.EditText");

  await searhInputText.click();
  await searhInputText.setValue(search);
  await searhInputText.hideKeyboard();
});


Then("I should only Crystal", async () => {
  const crystalItem = await $("~Crystal\n฿5.33");

  await expect(crystalItem).toBeExisting();
});