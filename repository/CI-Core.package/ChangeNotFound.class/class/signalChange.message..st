signalling
signalChange: aChange message: aMessage
	^ self new
		change: aChange;
		signal: aMessage