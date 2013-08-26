I am an abstract representation of an issue tracker case mainly used to define protocol methods.

Description :

Change contains many informations about changesets, URL repository, name, id, which version to use and how to load changesets in the system.

Change will be used by manager to start the validation process. 

CIManager >> validate: aChange
	"return a CIValidationResult which will be used by CIPublisher"
	^ self validationRule validate: aChange