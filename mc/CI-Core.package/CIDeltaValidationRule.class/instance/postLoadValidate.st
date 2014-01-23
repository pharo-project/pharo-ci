validation
postLoadValidate
	"Run the validation checks after loading the change"
	validationResult := CIValidationResult new.
	^ self basicValidate