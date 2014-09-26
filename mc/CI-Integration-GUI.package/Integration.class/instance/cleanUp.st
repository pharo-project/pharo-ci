private executing
cleanUp
	"clean working dirctory"
	self runCommandWaitForAnswer: ('rm -Rf {1}/*' format: { self workingDirectory fullName })