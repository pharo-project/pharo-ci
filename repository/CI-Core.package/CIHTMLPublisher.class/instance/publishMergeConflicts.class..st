helper merge conflict
publishMergeConflicts: conflicts class: class
	
	
	self stream << '<tr><td></td><td colspan="2"><strong>' << class name << '</strong></td></tr>';lf.
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