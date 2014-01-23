queries
extractTokenFrom: response

	| startIdentifier stopIdentifier firstIndex offset lastIndex |

	startIdentifier := self startTokenResponseIdentifier.
	stopIdentifier := self stopTokenResponseIdentifier.

	firstIndex := response findString: startIdentifier.
	offset := startIdentifier size.
	lastIndex := response findString: stopIdentifier startingAt: firstIndex.

	^ response copyFrom: firstIndex+offset to: lastIndex-1