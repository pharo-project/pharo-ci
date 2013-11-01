validation
preLoadValidate
	"Override the preload validation to not use the CITestResult to lower the noise stdout "
	^ previousResult := (self basicValidate: CITestResult new beQuiet) copy.