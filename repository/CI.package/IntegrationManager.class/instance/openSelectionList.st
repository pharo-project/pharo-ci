display
openSelectionList

	| window |
	window := self listDialogClass
		itemsList: self allReadyForIntegrationIssues
		itemsHeaderName: 'Issues ready for integration '
		wrapBlockOrSelector: [:item | item name]
		title: 'Integration'.
		
	^ window choose