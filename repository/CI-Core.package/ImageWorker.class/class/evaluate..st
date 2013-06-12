image-evaluation
evaluate: aBlock
	| worker result process |
	
	worker := self new.
	"process is usefull to prevent a timeout from Seamless, just in case of."
	process := Process
		forContext: 
			[[[ VTermOutputDriver stderr green: 'waiting...';lf. 1 seconds wait. (worker remote at: #DateAndTime) now ] repeat ] value.
			Processor terminateActive] asContext
		priority: Processor activePriority.
	process resume.
	worker isForkedImage 	
		ifFalse: [ result := worker evaluate: aBlock ].
	process terminate.
	worker close.
	^ result