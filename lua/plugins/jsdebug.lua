return {
  "microsoft/vscode-js-debug",
  opt = true,
  config = "npm install --legacy-peer-deps && npx gulp vsDebugServerBundle && mv dist out",
}
