validation
validateLocally: aValidationRule
	"This method is called from the host image, the current receiver is in a slave image (e.g. remote)."
	| rule |
	"make sure we have a full local copy of the given validation rule"
	rule := aValidationRule asLocalObject.
	"validate the rule with its change in this slave image"
	rule validateChangeBlock: [ rule change load ].
	"unset the change in the current validation result avoiding it to be serialized again when sending the result back over seamless"
	rule validationResult change: nil.
	"return the result, which is sent over the wire with seamless"
	^ rule validationResult