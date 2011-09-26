private
closeIssues

	issuesToIntegrate do: [:issue | issue integrateInVersion: self newVersionNumber ] inParallel: 8.
	issuesToIntegrate do: [:issue | issue fixToInclude ] inParallel: 8