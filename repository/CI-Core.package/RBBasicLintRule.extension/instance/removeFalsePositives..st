*CI-Core
removeFalsePositives: rule
	| oldResult |
	oldResult := result.
	result := result \ rule result.
	result label: oldResult label.