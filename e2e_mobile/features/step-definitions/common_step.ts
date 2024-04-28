import { Given } from "@wdio/cucumber-framework";

Given("I am on the onboarding screen", async () => {
  const nextButton = await $("~NEXT");
  const doneButton = await $("~DONE");

  await nextButton.click();
  await nextButton.click();
  await doneButton.click();
});
