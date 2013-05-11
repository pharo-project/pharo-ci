validation
recordEnvironmentChangeDuring: aChangeBlock
	| oldEnvironment |
	"oldEnvironment := self environmentCopy."
	aChangeBlock value.
	"environmentChange := CIEnvironmentChange from: oldEnvironment to: self environmentCopy."