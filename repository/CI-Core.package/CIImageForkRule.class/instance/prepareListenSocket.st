image forking
prepareListenSocket
	
	| oldSocket |
	readSocket closeAndDestroy.
	oldSocket := Socket newTCP.
	oldSocket  listenOn: self communicationPort backlogSize: 10.
	readSocket := oldSocket waitForAcceptFor: self timeout asSeconds.
	oldSocket closeAndDestroy.