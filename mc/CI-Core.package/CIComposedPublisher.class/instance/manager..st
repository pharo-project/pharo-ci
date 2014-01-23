accessing
manager: aCIChangeManager
	super manager: aCIChangeManager.
	self publishers do: [ :publisher |
		publisher manager: aCIChangeManager ]