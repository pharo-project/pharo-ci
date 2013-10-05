| version versionString |
Gofer new
	smalltalkhubUser: 'dh83' project: 'FileSystemST';
	package: 'ConfigurationOfFileSystemST';
	load.

version := SystemVersion current highestUpdate asString.
FileStream stdout nextPutAll: 'Extracting commit message';lf.
versionString := [(ScriptLoader >> ('update', version) asSymbol) literals 
		detect: [ :e| e isString and: [ e isSymbol not ]]
		ifNone: [ '' ]
	] on: Error do: [ :e | '' ].

version asFileReference writeStreamDo: [ :stream| 
	stream 
		nextPutAll: version; cr; lf;
		nextPutAll: versionString ].



FileStream stdout nextPutAll: 'Installing FileSystemST';lf.
(Smalltalk at: #ConfigurationOfFileSystemST) loadDevelopment.


FileStream stdout nextPutAll: 'Exporting all Packages';lf.
(FileSystem st root) copyAllTo: 'pharo-core' asFileReference.

FileStream stdout nextPutAll: 'Converting Line Endings';lf.
'pharo-core' asFileReference allFiles 
  select: [ :file | file extension = 'st' ]
  thenDo: [ :file |
    | contents |
    contents := file readStream binary contents.
    contents
        replaceAll: Character cr asciiValue
        with: Character lf asciiValue.
    file delete.
    file writeStreamDo: [ :stream| 
        stream binary.
        stream nextPutAll: contents ]].

Smalltalk snapshot: true andQuit: true.
