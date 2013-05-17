validation
preLoadValidate
	"Unlike the standard CITestChangeDifferenceRule tests should not be run twice in the same image.
	Hence we launch the first test in yet another image"
	^ previousResult := self imageForker forkDo: [ self basicValidate ].