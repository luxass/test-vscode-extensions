import { defineExtension, useCommand, useLogger } from "reactive-vscode";
import { window } from "vscode";

const { activate, deactivate } = defineExtension(() => {
  const logger = useLogger("pnpm-pm-test-extension");
  logger.info("Extension Activated");

  useCommand("pnpm-pm-test-extension.hello", () => {
    window.showInformationMessage("Hello World!");
  });
});

export { activate, deactivate };
