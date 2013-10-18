helper
publishMergeConflicts: conflicts class: class
	
	
	self stream << '<tr><td colspan="3">' << class name << '</td></tr>';lf.
	conflicts do: [ :each |
		 self stream << '<tr><td><span class="glyphicon glyphicon-'.
		each isAddition
			ifTrue: [ self stream << 'plus' ].
		each isRemoval
			ifTrue: [ self stream << 'minus' ].
		each isModification
			ifTrue: [ self stream << 'transfer' ].
		 self stream 
			<< '"></span>'.
		self exportMergeRecord: each.
		self stream
			<< '</tr>'; lf ].