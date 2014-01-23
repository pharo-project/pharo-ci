private
closeAll
	"update the status of the integrated issues, we do this in parallel since the requests to the issue tracker take a while"
	
	"mark the release for which they have been integrated"
	FileStream stdout nextPutAll: '=============== close all issues ===============';cr.
	issuesToIntegrate do: [:e | FileStream stdout print: e;cr ].
	issuesToIntegrate do: [:issue | issue integratedInVersion: self newVersionNumber ] inParallel: 8.
	FileStream stdout nextPutAll: '================ Issues closed ================';cr.