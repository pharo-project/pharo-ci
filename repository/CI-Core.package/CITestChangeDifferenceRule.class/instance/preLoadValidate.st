validation
preLoadValidate
	"Run the validation before loading the change and store the intermediate validation result for later removal of false-positives"
	^ previousResult := self basicValidate copy.