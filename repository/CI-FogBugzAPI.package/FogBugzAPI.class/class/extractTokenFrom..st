queries
extractTokenFrom: respons

	| startIdentifier stopIdentifier firstIndex offset lastIndex |

	startIdentifier := self startTokenResponsIdentifier.
	stopIdentifier := self stopTokenResponsIdentifier.

	firstIndex := respons findString: startIdentifier.
	offset := startIdentifier size.
	lastIndex := respons findString: stopIdentifier startingAt: firstIndex.

	^ respons copyFrom: firstIndex+offset to: lastIndex-1