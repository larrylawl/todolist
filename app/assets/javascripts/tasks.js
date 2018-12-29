$(document).on("turbolinks:load",function () {
	// Subtasks
	$("section#subtasks").hide();

	// Task
	$("#task_todo").focus();
	$("form").keypress(function(event) {
		if(event.which == 13) {
			$(this).trigger('submit.rails');
		}
	});
})