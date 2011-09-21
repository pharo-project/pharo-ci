checking
lastMessageFrom: anEmailString

	| messagesFrom |
	messagesFrom := self comments select: [:comment | comment author = anEmailString ].
	messagesFrom := messagesFrom sort: [:a :b | a updated < b updated ].
	^ messagesFrom last