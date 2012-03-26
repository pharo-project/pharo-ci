preload
preloadOSProcess

	{ 'OSProcess-Base'. 'OSProcess' } do: [:each |
		Gofer new
			squeaksource: 'OSProcess' ;
			package: each;
			load ]
