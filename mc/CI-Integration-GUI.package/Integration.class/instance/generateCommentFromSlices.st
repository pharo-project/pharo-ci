private
generateCommentFromSlices
	^ ScriptLoader new commentForIssues: (self issues collect: #id)