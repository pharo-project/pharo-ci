delegating issue tracker
loadCase: aCase
	"fetch and load slice"
	(self sliceFor: aCase) ifNotNil: [ :slice | slice merge ]