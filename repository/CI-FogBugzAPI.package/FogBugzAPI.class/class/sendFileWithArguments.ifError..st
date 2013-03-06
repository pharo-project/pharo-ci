private
sendFileWithArguments: arguments ifError: aBlock
 	| client entity response files |
	
	client := ZnClient new
				url: self pharoIssueTrackerURL;
				yourself.
	
	entity := client multiPartFormDataEntity.
	files := arguments associations select:[ :e | e key beginsWith: 'File' ].
	files do: [:association |
		entity addPart: (ZnMimePart fieldName: association key fileName: association value asFileReference basename entity: (ZnEntity bytes: association value asFileReference readStream binary contents)) ].
				
	arguments associationsDo: [:association | client queryAt: association key put: association value ].
	
	response := client post.
	client response isError  ifTrue: aBlock.
	^ response