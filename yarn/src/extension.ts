import { defineExtension, useCommand, useLogger } from "reactive-vscode";
import { window } from "vscode";

const { activate, deactivate } = defineExtension(() => {
  const logger = useLogger("yarn-pm-test-extension");
  logger.info("Extension Activated");

  useCommand("yarn-pm-test-extension.yarn", () => {
    window.showInformationMessage("This is using Yarn as package manager!");
  });
});

export { activate, deactivate };
