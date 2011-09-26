loading
loadSources
	"Download sources from the internet in parallele"
	
	'Loading sources'
		displayProgressAt: Display center
		from: 0 
		to: issuesToIntegrate size
		during: [:bar |
			issuesToIntegrate doWithIndex: [: each :index | 
				each loadSource.
				bar value: index ] inParallel: 8 ].