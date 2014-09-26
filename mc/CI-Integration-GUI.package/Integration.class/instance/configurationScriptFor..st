private script
configurationScriptFor: anIssue
	^ String streamContents: [ :stream |
		stream << 'ScriptLoader new addConfiguration: ''' << anIssue configurationName << ''' version: ''' << anIssue version << '''.'  ]