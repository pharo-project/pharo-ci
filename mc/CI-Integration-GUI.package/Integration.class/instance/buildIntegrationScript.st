private script
buildIntegrationScript
	^ String streamContents: [ :stream | 
		stream << 'ScriptLoader new prepareNewUpdateSilently.' << String cr.
		(self issues select: #isSlice) ifNotEmpty: [ :slices |
			stream << 'Gofer it 
	smalltalkhubUser: ''Pharo'' project: ''' << self inboxProjectName << ''';' << String cr.
			slices do: [ :each | 
				| slice |
				slice := each version ifNil: [ each fetchLatestVersionNameOn: self ].
				stream << Character tab << 'version: ''' << slice << ''';' << String cr ] .
			stream << Character tab << 'merge.' << String cr ].
		stream << 'ScriptLoader new 
	doneApplyingChangesSilentlyComment: ''' << self commentOrDefault << ''' 
	configurations: ' << self configurationsAsArray asString << '
	preLoad: (''' << self collectPreLoad << ''' readStream)
	postLoad: (''' << self collectPostLoad << ''' readStream).' << String cr.
		stream << 'ScriptLoader new 
	publicChangesSilently: ' << (self issues collect: #id) asString << '
	user: ''' << self username << '''
	password: ''' << self password << '''' ]