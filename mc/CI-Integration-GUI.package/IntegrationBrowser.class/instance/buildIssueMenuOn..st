initialization
buildIssueMenuOn: menu
	menu addGroup: [ :group | 
		group addItem: [ :item | 
			item 
				name: 'Verify changes';
				action: [ self verifyChanges: self issueList highlightedItem content ];
				shortcut: $v command mac | $v alt win ].
		group addItem: [ :item | 
			item 
				name: 'Verify with merge';
				action: [ self verifyMerge: self issueList highlightedItem content ];
				shortcut: $v shift command mac | $v shift alt win ].
		group addItem: [ :item | 
			item 
				name: 'Detail';
				action: [ self showDetail: self issueList highlightedItem content ];
				shortcut: $d command mac | $d alt win ].
		group addItem: [ :item | 
			item 
				name: 'Open in browser';
				action: [ self openExternalBrowser: self issueList highlightedItem content ];
				shortcut: $b command mac | $b alt win ] ]