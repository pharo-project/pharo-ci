*CI-Core
currentNode
	|  activePC |
	activePC := pc 
		ifNil: [ self startpc + 1]
		ifNotNil: [pc - 1].
	activePC <= self startpc ifTrue: [ activePC := pc ].
	^(method sourceNodeForPC: activePC)