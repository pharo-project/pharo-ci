instance creation
fromXML: xml
 
	name := (xml findTag: 'sfilename') children first text.
	url := (xml findTag: 'surl') children first text.