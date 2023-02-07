// The module 'vscode' contains the VS Code extensibility API
// Import the module and reference it with the alias vscode in your code below
import * as vscode from 'vscode';
const fs = require('fs');
const path = require('path');
//import path from 'path';
// const path = require('path');

// This method is called when your extension is activated
// Your extension is activated the very first time the command is executed
export function activate(context: vscode.ExtensionContext) {

	// Use the console to output diagnostic information (console.log) and errors (console.error)
	// This line of code will only be executed once when your extension is activated
	console.log('Congratulations, your extension "testelf" is now active!');

	// The command has been defined in the package.json file
	// Now provide the implementation of the command with registerCommand
	// The commandId parameter must match the command field in package.json
	let disposableA = vscode.commands.registerCommand('webpackElf.helloElf', () => {
		// The code you place here will be executed every time your command is executed
		// Display a message box to the user
		vscode.window.showInformationMessage('Hello from Webpack Elf!');
	});

	let disposable = vscode.commands.registerCommand('webpackElf.createBoilerplate', () => {
		// The code you place here will be executed every time your command is executed
		// Display a message box to the user
		// vscode.window.showInformationMessage('Hello World from testelf!');

		if (!vscode.workspace) {
			return vscode.window.showErrorMessage('Please open a project folder first');
		}
		let folderPath = 's';
		if (vscode.workspace.workspaceFolders) {
			folderPath = vscode.workspace.workspaceFolders[0].uri
				.toString()
				.split(':')[1];
		}

		const htmlContent = `<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <meta http-equiv="X-UA-Compatible" content="ie=edge" />
  <title>Document</title>
  <link rel="stylesheet" href="app.css" />
</head>
<body>
  <script src="app.js"></script>
</body>
</html>`;

		fs.writeFile(path.join(folderPath, 'index.html'), htmlContent, (err: any) => {
			if (err) {
				return vscode.window.showErrorMessage(
					'Failed to create boilerplate file!'
				);
			}
			vscode.window.showInformationMessage('Created boilerplate files');
		});
	});
}

// This method is called when your extension is deactivated
export function deactivate() { }
