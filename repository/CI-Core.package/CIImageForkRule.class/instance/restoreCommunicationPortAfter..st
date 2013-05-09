protocol
restoreCommunicationPortAfter: aBlock
	| oldCommunicationPort |
	
	oldCommunicationPort := self communicationPort.
	
	^ aBlock ensure: [
		oldCommunicationPort ifNotNil: [ 
			communicationPort := oldCommunicationPort ]]