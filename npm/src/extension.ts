import { defineExtension, useCommand, useLogger } from "reactive-vscode";
import { window } from "vscode";

const { activate, deactivate } = defineExtension(() => {
  const logger = useLogger("npm-pm-test-extension");
  logger.info("Extension Activated");

  useCommand("npm-pm-test-extension.npm", () => {
    window.showInformationMessage("This is using NPM as package manager!");
  });
});

export { activate, deactivate };
