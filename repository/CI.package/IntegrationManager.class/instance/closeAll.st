private
closeAll
	"update the status of the integrated issues, we do this in parallel since the requests to the issue tracker take a while"
	
	"mark the release for which they have been integrated"
	issuesToIntegrate do: [:issue | issue integrateInVersion: self newVersionNumber ] inParallel: 8.
	
	"mark them ready for integration"
	issuesToIntegrate do: [:issue | issue fixToInclude ] inParallel: 8