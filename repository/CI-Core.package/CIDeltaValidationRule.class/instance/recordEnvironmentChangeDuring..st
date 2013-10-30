validation
recordEnvironmentChangeDuring: aChangeBlock
	"This method records the Packages, Classes, Protocols and Methods modified by aChangeBlock"
	| oldEnvironment |
	"Not yet implemented"
	"oldEnvironment := self environmentCopy."
	aChangeBlock value.
	"environmentChange := CIEnvironmentChange from: oldEnvironment to: self environmentCopy."