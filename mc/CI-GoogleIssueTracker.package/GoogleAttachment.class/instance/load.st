accessing
load
	filename := ('name=[^&]+' asRegex matchesIn: url) first allButFirst: 'name=' size.