helper
exportMergeRecord: anMCPatchOperation
	self stream
		<< '</td>';
		<< '<td>'.
	anMCPatchOperation baseDefinition ifNotNil: [ :definition |
		self stream << '<code>'; print: definition timeStamp; << '</code>'; lf ].
	
	self stream
		<< '<pre>'; 
		<< anMCPatchOperation diffFromSource; 
		<< '</pre></td>'; lf;
		<< '<td>'.
	
	anMCPatchOperation targetDefinition ifNotNil: [ :definition |
		self stream << '<code>'; print: definition timeStamp; << '</code>'; lf ].
	self stream
		<< '<pre>'; 
		<< anMCPatchOperation diffToSource; 
		<< '</pre></td>'; lf