loading
preLoadScript

	^ preloadScript ifNil: [ preloadScript := FileStream fileNamed: 'preload.st' ]