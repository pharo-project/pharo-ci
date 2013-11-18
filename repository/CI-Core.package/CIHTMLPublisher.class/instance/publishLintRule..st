helper
publishLintRule: aLintRule
	| result |
	self flag: 'Use the real objects instead of accessing only the names'.
	result := aLintRule result ciElementNames.
	self
		publishResultGroupWithTitle: aLintRule name 
		count: aLintRule problemCount 
		with: [
			self stream << aLintRule rationale << '</p><p>'.
			result isCollection
				ifTrue: [ 
					result 
						do: [ :each | self stream << '<code>'; << each; << '</code>' ]
						separatedBy: [ self stream << ', ' ]]
				ifFalse: [ self stream print: result ]]