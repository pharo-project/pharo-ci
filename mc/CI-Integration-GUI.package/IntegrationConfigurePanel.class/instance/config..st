accessing
config: aConfig
	"self versionText text: aConfig version asString."
	self usernameText text: aConfig username.
	self passwordText text: aConfig password.
	self externalBrowserText text: aConfig externalBrowserCommand