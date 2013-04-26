protocol
changeWithId: aVersion group: aGroupName
	"Returns a CIConfigurationChange for the given version and group.
	aVersion might be a numeric version such as: '1.0', '1.1' or as well a symbolic version name such as: #stable, #development, #last"
		self shouldBeImplemented