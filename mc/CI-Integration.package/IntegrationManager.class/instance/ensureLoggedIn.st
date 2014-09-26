private
ensureLoggedIn
	self tracker isLoggedIn 
		ifFalse: [  
			self tracker 
				logOnWithEmail: self class userName
				password: self class password ].

	^ self tracker isLoggedIn