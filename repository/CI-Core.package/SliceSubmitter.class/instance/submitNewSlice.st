protocol
submitNewSlice
	| slice creator wc |
	
	self tracker ifNil: [ ^ self ].
	self mcPackage ifNil: [ ^ self ].
	wc :=  self mcPackage workingCopy.
	wc modified ifFalse: [ ^ self ].
	
	(self viewChangesFor: wc)
		ifFalse: [ ^ self ].
	
	slice := MCSliceInfo new
				includedPackages: { wc };
				yourself.
				
	creator := IssueCreator new
					issue: issue;
					yourself.
	 
	self receiver openModal: creator openDialogWithSpec.
	creator cancelled ifTrue: [ ^ self ].
	issue description: (String streamContents: [:s |
								s << issue description content.
								s cr;cr.
								s << '-------------------';cr.
								s<< 'Slice is in the inbox']).
	[ issue submitAsNewEntry ] on: ErrorWhileCreationException do: [ ^ self ].

	slice issueNumber: issue id asString.
	slice issueSummary: issue title.
	slice := slice makeSlice.
	self postNewSlice: slice message: issue description content.
	
	issue
		status: PharoTrackerLabels reviewNeeded;
		submitStatusChange