publishing
diffScript
	 ^'
$(document).ready(function() {
	$(".mergeRecordOld").each(addDiffPatch);
});

var dmp = new diff_match_patch();

function addDiffPatch() {
	var newRecord = $(this).next(".mergeRecordNew");
	addDiffBetween($(this).children("code").first(), newRecord.children("code").first());
	addDiffBetween($(this).children("pre").first(), newRecord.children("pre").first());
}

function addDiffBetween(a, b) {
	var diff = dmp.diff_main(a.text(), b.text());
	a.html(dmp.diff_prettyHtml(diff))
};
' copyReplaceAll: String cr with: String lf.