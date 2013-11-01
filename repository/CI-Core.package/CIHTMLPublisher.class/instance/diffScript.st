publishing
diffScript
	 ^'
$(document).ready(function() {
	$(".mergeRecordOld").each(addDiffPatch);
});


function addDiffPatch() {
	var newRecord = $(this).next(".mergeRecordNew");
	addDiffBetween($(this).children("code").first(), newRecord.children("code").first());
	addDiffBetween($(this).children("pre").first(), newRecord.children("pre").first());
}

var diffTool = new diff_match_patch();

function addDiffBetween(a, b) {
	var diff = diffTool.diff_main(a.text(), b.text());
	diffTool.diff_cleanupSemantic(diff);
	a.html(diffTool.diff_prettyHtml(diff))
};
' copyReplaceAll: String cr with: String lf.