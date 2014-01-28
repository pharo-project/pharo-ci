accessing
defaultStyle
	^'
.mergeRecordOld, .mergeRecordNew { 
	min-width: 150px;
}
.exception-stack td { 
	font-family: Courier, Monospace;
}
.stackframe-popover {
	width: auto;
	min-width: 600px;
}
' copyReplaceAll: String cr with: String lf