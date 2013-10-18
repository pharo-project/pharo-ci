helper
publishResultGroupWithTitle: title count: count with: contentBlock
	self stream 
		<< '<h4 class="list-group-item-heading" data-toggle="collapse" data-target="#result-'; 
		print: itemId;
		<< '">'; 
		<< title.
	
	count > 0
		ifTrue: [ self stream << '<span class="badge pull-right">'; print: count; << '</span>' ].
	
	self stream
		<< '</h4>'; lf;
		<< '<div id="result-'; print: itemId; << '" class="list-group-item-text collapse out">'; lf.
	
	contentBlock value.
	
	self stream << '</div>'