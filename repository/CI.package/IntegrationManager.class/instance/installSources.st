loading
installSources
	"Install sequenticially sources from issues"

	| loaders |
	loaders := OrderedCollection new.
	
	'Installing sources'
		displayProgressAt: Display center
		from: 0 
		to: issuesToIntegrate size
		during: [:bar | issuesToIntegrate doWithIndex: [:issue :index | 
				bar value: index.
				loaders add: issue load ]].
	^ loaders