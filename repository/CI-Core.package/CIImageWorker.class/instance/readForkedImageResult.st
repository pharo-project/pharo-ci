private
readForkedImageResult
	"The result is a serialized Array with the result at the first position, and a boolean to indicate whether the result is an exception or not"
	| result |
	self resultFile exists
		ifFalse: [ 
			self inform: 'Forked Image did not produce result'.
			^ Error signal: 'Forked Image did not produce result' ].
	result := FLMaterializer materializeFromFileNamed: self resultFile fullName.
	result second 
		ifTrue: [ self resignalRemoteError: result first ]
		ifFalse: [ ^ result first ]