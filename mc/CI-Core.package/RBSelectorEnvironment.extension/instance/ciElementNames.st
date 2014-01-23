*CI-Core
ciElementNames
	^ (self methods sorted: CompiledMethod sortBlock) collect: #printString