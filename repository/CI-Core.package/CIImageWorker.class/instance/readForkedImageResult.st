private
readForkedImageResult
	"The result is a serialized Array with the result at the first position, and a boolean to indicate whether the result is an exception or not"
	| result |
	self resultFile exists
		ifFalse: [ ^ Error signal: 'Forked Image did not produce result' ].
	result := FLMaterializer materializeFromFileNamed: self resultFile fullName.
	result second 
		ifTrue: [ Error signal: 'TODO got error from image' ]
		ifFalse: [ ^ result first ]