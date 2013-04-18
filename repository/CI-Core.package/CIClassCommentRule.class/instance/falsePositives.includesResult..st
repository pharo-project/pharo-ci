testing
falsePositives: falsePositives includesResult: result
	| possibleFalsePossible |
	
	possibleFalsePossible := falsePositives
			detect: [ :falsePositive | result name = falsePositive name ] 
			ifNone: [ ^ false ].
	
	^ possibleFalsePossible  = result 