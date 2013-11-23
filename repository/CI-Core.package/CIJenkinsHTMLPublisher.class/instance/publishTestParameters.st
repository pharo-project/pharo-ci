helper parameters
publishTestParameters
	self additionalParemeters 
		at: 'Jenkins Job' 
		put: (String streamContents: [ :s |
				s 
					<< '<a href="'; << self buildUrl; <<'">';
					<< '<span class="label label-primary">'; 
					<< (Smalltalk os environment at: 'BUILD_TAG'); 
					<< '</span></a>']).
	^ super publishTestParameters