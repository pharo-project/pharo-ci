tests
testStructure
 	| classSelectors selectors |	
	
	classSelectors := self configuration class class selectors.
	selectors := self configuration class selectors.
	
	self testing: classSelectors contains: #load.
	self testing: classSelectors contains: #loadDevelopment.
	self testing: classSelectors contains: #loadBleedingEdge.
	self testing: classSelectors contains: #validate.
	
	self testing: selectors contains: #project.
	self testing: selectors contains: #stable:.
	self testing: selectors contains: #development:.
	self testing: selectors contains: #bleedingEdge:.
	^ self validationResult 
	
