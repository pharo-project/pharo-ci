instance creation
email: emailAddress password: password

	^ self new
		logOnWithEmail: emailAddress password: password;
		yourself