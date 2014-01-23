publishing
addHtmlStatusLink: aCIValidationResult
	"Add a link to the issue tracker status in the html publisher"
	| statusName |
	self flag: 'Here we hardcode a too many things: which issue tracker we use, which change we use...'.
	statusName := aCIValidationResult change case status asString.
	self htmlPublisher additionalParemeters
		at: 'Issue&nbsp;Status'
		put: '<a href="https://pharo.fogbugz.com/default.asp?W65#', statusName, '">', statusName, '</a>'