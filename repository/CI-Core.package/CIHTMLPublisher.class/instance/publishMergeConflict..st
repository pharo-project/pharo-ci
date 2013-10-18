helper
publishMergeConflict: anMCMergeResolutionRequest
	| conflicts |
	conflicts := anMCMergeResolutionRequest merger conflicts.
	self publishResultGroupWithTitle: 'Merge Conflicts' count: conflicts size with: [ 
		self stream 
			<< '<table class="table table-striped">'; lf;
			<< '<thead><tr> <th>Type</th> <th>Old</th> <th>New</th> </tr></thead>'; lf;
			<< '<tbody>'; lf.
		conflicts do: [ :each |
			 self stream << '<tr><td><span class="glyphicon glyphicon-'.

			each isAddition
				ifTrue: [ self stream << 'plus' ].
			each isRemoval
				ifTrue: [ self stream << 'minus' ].
			each isModification
				ifTrue: [ self stream << 'transfer' ].
			
			 self stream 
				<< '"></span></td>';
				<< '<td><pre>'; 
				<< (each baseDefinition ifNil: [ '' ] ifNotNil: [ :d| d source ]); 
				<< '</pre></td>'; lf;
				<< '<td><pre>'; 
				<< (each targetDefinition ifNil: [ '' ] ifNotNil: [ :d| d source ]); 
				<< '</pre></td>'; lf;
				<< '</tr>'; lf ].
		
		self stream << '</tbody></table>'
	]