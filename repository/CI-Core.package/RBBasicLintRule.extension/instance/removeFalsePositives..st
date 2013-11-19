*CI-Core
removeFalsePositives: rule
	| oldResult |
	oldResult := result.
	result := self resultClass onEnvironment: (result \ rule result).
	result label: oldResult label.