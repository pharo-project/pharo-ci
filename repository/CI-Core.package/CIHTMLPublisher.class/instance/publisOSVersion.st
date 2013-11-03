helper parameters
publisOSVersion
	self stream << '<tr><td style="min-width: 8em;">OS Version</td> <td>'; print: Smalltalk os; << '</td></tr>'; lf