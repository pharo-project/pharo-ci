integration-private
postXML: anXMLString
	| client entity |
	client := self tracker client.
	entity := ZnEntity text: anXMLString.
	entity contentType: ((ZnMimeType main: 'application' sub: 'atom+xml') setCharSetUTF8).
	client 
		url: self url, '/comments/full';
		entity: entity;
		post.
	
	^ client response