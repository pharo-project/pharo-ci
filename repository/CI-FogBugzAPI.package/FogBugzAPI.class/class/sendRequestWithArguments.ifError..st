private
sendRequestWithArguments: arguments ifError: aBlock
 	| client response |
	
	client := ZnClient new
				url: self pharoIssueTrackerURL;
				yourself.
				
	arguments associationsDo: [:association | client queryAt: association key put: association value ].
	
	response := client get.
	client response isError  ifTrue: aBlock.
	^ response