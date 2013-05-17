Gofer new
	smalltalkhubUser: 'dh83' project: 'FileSystemST';
	package: 'ConfigurationOfFileSystemST';
	load.

FileStream stdout nextPutAll: 'Installing FileSystemST';lf.
(Smalltalk at: #ConfigurationOfFileSystemST) loadDevelopment.


FileStream stdout nextPutAll: 'Exporting all Packages';lf.
(FileSystem st root) copyAllTo: 'pharo-core' asFileReference.