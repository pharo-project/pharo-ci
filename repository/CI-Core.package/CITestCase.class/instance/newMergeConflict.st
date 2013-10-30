accessing
newMergeConflict
	| definition definition2 snapshot snapshot2 merger |
	
	definition := (Object >> #name) asRingDefinition asMCMethodDefinition.
	definition2 := definition copy.
	definition2 instVarNamed: #category put: ''.

	snapshot  := MCSnapshot fromDefinitions: { definition }.
	snapshot2 := MCSnapshot fromDefinitions: { definition2 }.
	
	merger := MCThreeWayMerger
		base: snapshot
		target: snapshot2
		ancestor: MCSnapshot empty.
	
	^ MCMergeResolutionRequest new
		merger: merger;
		yourself