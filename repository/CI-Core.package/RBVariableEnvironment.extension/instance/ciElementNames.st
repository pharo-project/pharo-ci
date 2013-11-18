*CI-Core
ciElementNames
	^ ((self instanceVariables associations, self classVariables associations) select: #asString) sorted 