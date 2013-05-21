accessing
filePrefix
	^ filePrefix ifNil: [
		filePrefix := Smalltalk imageFile nextVersion basenameWithoutExtension, '_fork_', SmallInteger maxVal atRandom asString ]