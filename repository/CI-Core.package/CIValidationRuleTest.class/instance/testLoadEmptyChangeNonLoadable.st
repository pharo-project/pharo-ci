tests
testLoadEmptyChangeNonLoadable
	| rule result change |
	rule := self newInstance.
	change := self newChange.
	change isLoadable: false.
	result := rule validate: change.
	self deny: result isSuccess.