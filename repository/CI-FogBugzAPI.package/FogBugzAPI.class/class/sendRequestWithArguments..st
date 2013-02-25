private
sendRequestWithArguments: arguments
 	| client |
	
	client := ZnClient new
				url: self pharoIssueTrackerURL;
				yourself.
				
	arguments associationsDo: [:association | client queryAt: association key put: association value ].
	
	^ client get