helper parameters
publishChangeVersion: aValidationResult
	| change |
	change := aValidationResult change.
	
	self stream 
		<< '<tr><td>Loaded&nbsp;'; 
			<< change typeName; 
		<< '</td> <td> <a href="'; << change publicUrl; << '">'; 
			print: change; 
		<< '</a></td></tr>'; lf.