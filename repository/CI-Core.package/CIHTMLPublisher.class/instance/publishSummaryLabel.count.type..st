helper
publishSummaryLabel: labelString count: count type: type
	self stream 
		<< '<span class="label label-' << type << '">';
		print: count; space; << labelString; << (count = 1 ifTrue: [ '' ] ifFalse: [ 's' ]);
		<< '</span> '; lf