validation
preLoadValidate
	"Run the validation before loading the change"
	self basicValidate.
	"store the intermediate validation result for later removal of false-positives"
	previousResult := self validationResult copy.