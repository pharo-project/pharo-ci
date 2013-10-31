helper
exportMergeRecord: anMCPatchOperation
	self stream
		<< '</td>';
		<< '<td class="mergeRecordOld">'.
	
	anMCPatchOperation baseDefinition 
		ifNil: [ self stream << '<code></code>'; lf ]
		ifNotNil: [ :definition |
			self stream << '<code>'; print: definition timeStamp; << '</code>'; lf ].
	
	self stream
		<< '<pre>'; 
		<< anMCPatchOperation diffFromSource; 
		<< '</pre></td>'; lf;
		<< '<td class="mergeRecordNew">'.
	
	anMCPatchOperation targetDefinition 
		ifNil: [ self stream << '<code></code>'; lf ]
		ifNotNil: [ :definition | 
			self stream << '<code>'; print: definition timeStamp; << '</code>'; lf ].
	self stream
		<< '<pre>'; 
		<< anMCPatchOperation diffToSource; 
		<< '</pre></td>'; lf