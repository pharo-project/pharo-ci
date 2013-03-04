private
sendRequestWithArguments: arguments ifError: aBlock
 	| client response |
	
	(arguments keys anySatisfy: [:key | key beginsWith: 'File' ])
		ifTrue: [ ^ self sendFileWithArguments: arguments ifError: aBlock ].
	
	client := ZnClient new
				url: self pharoIssueTrackerURL;
				yourself.
				
	arguments associationsDo: [:association | client queryAt: association key put: association value ].
	
	response := client get.
	client response isError  ifTrue: aBlock.
	^ response