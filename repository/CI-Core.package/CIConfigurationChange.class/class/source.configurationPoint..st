instance creation
source: aCISource configurationPoint: aMetacelloVersion
	
	^ (self changeProvider: aCISource) 
		configurationPoint: aMetacelloVersion;
		yourself.