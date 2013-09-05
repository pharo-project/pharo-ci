private
runForkedImage
	[[ self waitForForkedImage ]
		valueWithin: self timeout onTimeout: [ 
			Error signal: 'Timeout Occurred' ].
		^ self readForkedImageResult
	] ensure: [ self cleanUp ]