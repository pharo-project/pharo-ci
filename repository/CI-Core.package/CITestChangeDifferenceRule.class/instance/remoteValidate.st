protocol
remoteValidate	
	"This method is called from the host image, the current receiver is in a slave image (e.g. remote)."
	"validate the rule with its change in this slave image"
	self validateChangeBlock: [ self change load ].
	"unset the change in the current validation result avoiding it to be serialized again when sending the result back over seamless"
	self validationResult change: nil.
	"return the result, which is sent over the wire with seamless"
	^ self validationResult