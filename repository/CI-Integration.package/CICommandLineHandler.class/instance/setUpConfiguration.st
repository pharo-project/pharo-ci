setup
setUpConfiguration

	"(self hasOption: 'version')
		ifTrue: "
	| source error |	
	
	error := false.
	[self argumentAt: 3 ] 
		on: Error,Halt,Exit 
		do: [ error := true].
	
	error 
		ifTrue: [ source := CIConfigurationChangeProvider url: (self argumentAt: 2) ]
		ifFalse: [ source := CIConfigurationChangeProvider url: (self argumentAt: 2)  configurationName:  (self argumentAt: 3) ] .
		
	manager :=  CIChangeManager 
			source: source
			validator: CIValidator configuration.
	self optionAt: 'group' ifPresent: [ :group | issue := manager changeWithGroup: group ].
	self optionAt: 'version' ifPresent: [ :id | ^ issue := manager changeWithId: id ].
	^ issue := manager changeWithId: #stable
