updating
loadSubcases
	"For performance reasons, the subcases are only loaded on demand"
	subcases := self tracker getIssuesWithIDs: subcases