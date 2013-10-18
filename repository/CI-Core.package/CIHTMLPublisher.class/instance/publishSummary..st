helper
publishSummary: aVlidationResult
	
	self
		publishSummaryLabel: 'Error' count: aVlidationResult errors size type: 'danger';
		publishSummaryLabel: 'Warning' count: aVlidationResult warnings size type: 'warning';
		publishSummaryLabel: 'Remark' count: aVlidationResult messages size type: 'info'.