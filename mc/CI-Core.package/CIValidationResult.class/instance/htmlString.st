printing
htmlString
	| string |
	string := self printString.
	^ string copyReplaceAll: String cr with: '<br/>'.
	