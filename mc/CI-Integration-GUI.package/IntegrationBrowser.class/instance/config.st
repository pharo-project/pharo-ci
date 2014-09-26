accessing
config
	^ config ifNil: [ config := IntegrationConfig readFromDiskOrCreate ]