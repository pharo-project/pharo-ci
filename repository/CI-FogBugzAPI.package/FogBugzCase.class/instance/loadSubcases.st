updating
loadSubcases
	"For performance reasons, the subcases are only loaded on demand"
	subcases := subcases collect: [ :each | self class forId: each ]