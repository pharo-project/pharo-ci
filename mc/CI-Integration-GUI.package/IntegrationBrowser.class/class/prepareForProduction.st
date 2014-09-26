production mode support
prepareForProduction
	"World allMorphsDo: #delete."
	Pharo3DarkTheme installFullTheme.
	self register.
	(Current := self new) openWorldWithSpec
