development support
updateConfiguration
	[[[ 
		(Smalltalk at: #Gofer) new
			package: self name;
			merge ] 	
			on: (Smalltalk at: #MCMergeOrLoadWarning ifAbsent: [ nil ]) 		do: [ :e| e resume: false ]] 		
			on: (Smalltalk at: #MCNoChangesException ifAbsent: [ nil ]) 		do: [ :e| e resume]] 
			on: (Smalltalk at: #MCMergeResolutionRequest ifAbsent: [ nil ]) 	do: [ :request |
																						request merger conflicts isEmpty
																							ifTrue: [ request resume: true ]
																							ifFalse: [ request pass ]].