helper parameters
publishChangeVersion: aValidationResult
	| change |
	change := aValidationResult change.
	
	self stream 
		<< '<tr><td>Loaded&nbsp;'; 
			<< change typeName asString; 
		<< '</td> <td> <a href="'; << change publicUrl asString; << '">'; 
			print: change; 
		<< '</a></td></tr>'; lf.