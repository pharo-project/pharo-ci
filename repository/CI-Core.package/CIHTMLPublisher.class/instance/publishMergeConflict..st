helper merge conflict
publishMergeConflict: anMCMergeResolutionRequest
	| conflicts |
	conflicts := anMCMergeResolutionRequest merger conflicts.
	self publishResultGroupWithTitle: 'Merge Conflicts' count: conflicts size with: [ 
		self stream 
			<< '<table class="table table-striped">'; lf;
			<< '<thead><tr> <th>Type</th> <th>Old</th> <th>New</th> </tr></thead>'; lf;
			<< '<tbody>'; lf.
		
		conflicts := conflicts groupedBy: [ :each | each targetClass ].
		(conflicts keys sorted: [ :a :b | a name <= b name ]) do: [ :class | 
			self publishMergeConflicts: (conflicts at: class) class: class ].
		
		self stream << '</tbody></table>'
	]