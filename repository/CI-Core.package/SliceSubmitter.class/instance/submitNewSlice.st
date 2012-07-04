protocol
submitNewSlice
	| slice creator |
	
	self mcPackage ifNil: [ ^ self ].
	slice := MCSliceInfo new
				includedPackages: { MCWorkingCopy allManagers detect: [:e | e modified and: [e package = self mcPackage ]] ifNone: [ self halt ] };
				yourself.
				
	creator := IssueCreator new
					issue: issue;
					yourself.
					
	self receiver openModal: creator openDialogWithSpec.
	issue description: (String streamContents: [:s |
								s << issue description content.
								s cr;cr.
								s << '-------------------';cr.
								s<< 'Slice is in the inbox']).
	[ issue submitAsNewEntry ] on: ErrorWhileCreationException do: [ ^ self ].

	slice issueNumber: issue id asString.
	slice issueSummary: issue title.
	slice := slice makeSlice.
	self postNewSlice: slice.
	
	issue
		status: PharoTrackerLabels reviewNeeded;
		submitStatusChange