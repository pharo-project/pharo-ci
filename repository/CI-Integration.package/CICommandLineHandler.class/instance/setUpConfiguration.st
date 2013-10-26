setup
setUpConfiguration

	"(self hasOption: 'version')
		ifTrue: "
	| source error configurationName |	
	
	error := false.
	[ configurationName := self argumentAt: 3 ] 
		on: Error
		do: [ error := true ].
	
	source := CIConfigurationChangeProvider url: (self argumentAt: 2).
	error 
		ifFalse: [ source configurationName: configurationName ] .
		
	manager :=  CIChangeManager 
			changeProvider: source
			validator: CIValidator configuration.
			
	self 
		optionAt: 'group' 
		ifPresent: [ :group |
			issue := manager changeWithGroup: group ].
	self
		optionAt: 'version'
		ifPresent: [ :id |
			^ issue := manager changeWithId: id ].
	
	^ issue := manager changeWithId: #stable
