helper
publishError: anError	
	self 
		publishResultGroupWithTitle: ('Exception: <code>', anError printString, '</code>')
		with: [ | contexts |
			self stream 
				<< '<table class="table table-condensed table-striped exception-stack">'; lf;
				<< '<thead><tr><th>Class</th><th>Method</th></tr></thead>'; lf;
				<< '<tbody>'; lf.
				
			contexts := anError signalerContext 
				ifNil: [ { } ]
				ifNotNil: [ :context | context stackOfSize: 100 ].
				
			contexts withIndexDo: [ :context :index |	
				self stream 
					<< '	<tr id="stackframe_'; print: index; <<'" class="stackframe"><td>';
					<< context classColumnString;
					<< '	</td><td>';
					<< context methodColumnString;
					<< '	</td></tr>' ].
			self stream
				<< '</tbody></table>'; lf;
				<< '<div style="display:none">'.
			
			contexts withIndexDo: [ :context :index | | source sourceInterval |
				self stream
					<< '<div id="stackframe_'; print: index; << '_content">'; lf.
				context tempNames isEmpty 
					ifFalse: [ 
						self stream << '<table class="table table-condensed table-striped" >'; lf.
						context tempNames do: [ :name |
							self stream 
								<< '	<tr><td>'; << name; 
								<< '	</td><td>'; << ((context tempNamed: name) printStringLimitedTo: 50); 
								<< '	</td></tr>'].
						self stream << '</table>'; lf ].
				self stream << '<pre>'; lf.
				source := context method asString.
				sourceInterval := context currentNode sourceInterval.
				self stream 
					<< (source first: sourceInterval first-1);
					<< '<span style="box-shadow: 0px 0px 5px rgba(0,0,0,0.5);">'; 
					<<  (source copyFrom: sourceInterval first to: sourceInterval last);
					<< '</span>';
					<< (source allButFirst: sourceInterval last);
					<< '</pre>'; lf;
					<< '</div>' ].
			self stream << '</div>'.
			self stream
				<< '<script>';
				<< '$("#result-'; print: itemId; << ' .stackframe").each(function (){'; lf;
				<< '	$(this).popover({'; lf;
				<< '		trigger: "hover",'; lf;
				<< '		placement: "bottom",'; lf;
				<< '		html: true,'; lf;
				<< '		 template: ''<div class="popover stackframe-popover"><div class="arrow"></div><div class="popover-inner"><h3 class="popover-title"></h3><div class="popover-content"><p></p></div></div></div>'','; lf;
				<< '		content: $("#result-'; print: itemId; << ' #"+$(this).prop("id")+"_content").html()'; lf;
				<< '	})'; lf;
				<< '})'; lf;
				<< '</script>'
		]