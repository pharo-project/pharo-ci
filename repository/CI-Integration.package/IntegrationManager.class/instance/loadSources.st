loading
loadSources
	"Download sources from the internet in parallel"
	
	'Loading sources'
		displayProgressAt: Display center
		from: 0 
		to: issuesToIntegrate size
		during: [:bar | |progress|
			progress := 0.
			issuesToIntegrate 
				do: [: each | 
					each loadSource.
					progress := progress + 1.
					bar value: progress] 
				inParallel: 8 ].