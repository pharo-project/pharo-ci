instance-creation
newImageDo: aBlock
	^ self newImageDo: aBlock onTimeout: [ :e | e pass ]