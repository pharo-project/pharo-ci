accessing
addAllFailures: aCollection 
	"For now we do #asString to circument some issue with serializing classes"
	self failures addAll: (aCollection collect: #asString).