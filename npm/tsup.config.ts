import { defineConfig } from "tsup";

export default defineConfig({
  entry: ["src/extension.ts"],
  format: ["cjs"],
  clean: true,
  treeshake: true,
  bundle: false,
  target: ["node18", "es2022"],
  platform: "node",
  external: ["vscode"],
});
