helper
publishLintRule: aLintRule
	| result |
	result := aLintRule result.
	
	(result isKindOf: RBClassEnvironment)
		ifTrue: [ result := result classNames sorted ].
	(result isKindOf: RBPackageEnvironment)
		ifTrue: [ result := result packageNames sorted ].
	(result isKindOf: RBSelectorEnvironment)
		ifTrue: [ result := (result methods sorted: CompiledMethod sortBlock) collect: #printString ].
	
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