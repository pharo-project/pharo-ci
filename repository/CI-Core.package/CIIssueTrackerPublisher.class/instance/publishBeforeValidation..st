publishing
publishBeforeValidation: aCIChange
	"lock the issue"
	self halt.
	aCIChange lockForValidation