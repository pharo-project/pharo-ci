helper
publishResultList: list title: aString 
	| filteredList |
	filteredList := list.
	self stream 
		<< '<h2>'; << aString; << '</h2>';
		<< '<ul class="list-group">'; lf.

	filteredList := self 
		publishList: filteredList 
		kind: MCMergeResolutionRequest 
		do: [ :each | self publishMergeConflict: each ].
	filteredList := self 
		publishList: filteredList
		kind: Error
		do: [ :each | self publishError: each ].
	filteredList := self 
		publishList: filteredList
		kind: RBLintRule
		do: [ :each | self publishLintRule: each ].
	
	"For the left-over items we just print the strings in a list"
	filteredList do: [ :each | 
		self stream << '<li class="list-group-item"><h4 class="list-group-item-heading">' << each asString; << '</h4></li>'; lf ].
	
	self stream << '</ul>'; lf.