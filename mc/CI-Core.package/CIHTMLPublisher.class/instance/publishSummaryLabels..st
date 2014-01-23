helper summary
publishSummaryLabels: aValidationResult
	self
		publishSummaryLabel: 'Error'   count: aValidationResult errors size   type: 'danger';
		publishSummaryLabel: 'Warning' count: aValidationResult warnings size type: 'warning';
		publishSummaryLabel: 'Remark'  count: aValidationResult messages size type: 'info'.