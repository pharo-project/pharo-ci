updating
loadParentCase
	"For performance reasons, the parentCase is only loaded on demand"
	parentCase := self tracker getIssueWithID: parentCase