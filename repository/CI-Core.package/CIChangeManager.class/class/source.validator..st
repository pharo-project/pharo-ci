instance creation
source: anIssueSource validator: aCIValidator
	
	^ self new
		source: anIssueSource;
		validator: aCIValidator;
		publisher: anIssueSource publisher;
		yourself