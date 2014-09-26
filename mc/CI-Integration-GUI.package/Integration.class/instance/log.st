private
log 
	self logFileReference exists ifFalse: [ ^ nil ].
	^ self logFileReference contents