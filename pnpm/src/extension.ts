import { defineExtension, useCommand, useLogger } from "reactive-vscode";
import { window } from "vscode";

const { activate, deactivate } = defineExtension(() => {
  const logger = useLogger("pnpm-pm-test-extension");
  logger.info("Extension Activated");

  useCommand("pnpm-pm-test-extension.pnpm", () => {
    window.showInformationMessage("This is using PNPM as package manager!");
  });
});

export { activate, deactivate };
