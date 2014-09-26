reading
readFromDiskOrCreate
	^ self readFromDisk ifNil: [
		self new 
			version: self defaultVersion;
			externalBrowserCommand: self defaultExternalBrowserCommand;
			store ]