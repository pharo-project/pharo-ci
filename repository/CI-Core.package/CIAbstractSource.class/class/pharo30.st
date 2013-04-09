instance creation
pharo30
	^ self new
		inboxUrl: 'http://smalltalkhub.com/mc/Pharo/Pharo30Inbox/main';
		tracker: FogBugzTracker pharo;
		yourself