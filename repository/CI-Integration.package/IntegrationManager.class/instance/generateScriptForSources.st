loading
generateScriptForSources
	"Sequenticially install sources from the issues"

	FileDirectory default forceNewFileNamed: 'loading.st' do: [:stream || comment |
		'Generating script'
			displayProgressAt: Display center
			from: 0 
			to: issuesToIntegrate size
			during: [:bar | 
				issuesToIntegrate doWithIndex: [:issue :index | 
					bar value: index.
					stream 
						nextPutAll: issue script;
					 	nextPutAll: '.' ;
						nextPutAll: String crlf ]].
		comment := String streamContents: [:strm |
						issuesToIntegrate do: [:each | 
							strm << each name << 'Thanks to ' << each description author email ; lf;lf.
							strm << each url;lf;lf;lf.]].
		stream
			nextPutAll: 'ScriptLoader new doneApplyingChangesSilentlyComment: ';
			nextPutAll: comment printString;
			nextPutAll:' preLoad: (FileStream fileNamed:  ';
			nextPutAll: self preLoadScript name printString;
			nextPutAll:') postLoad: (FileStream fileNamed:  ';
			nextPutAll:self postLoadScript name printString;
			nextPutAll:').';
			cr;
			nextPutAll: 'Smalltalk snapshot: true andQuit: true.' ]