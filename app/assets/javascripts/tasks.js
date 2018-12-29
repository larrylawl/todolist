/*
Resets form by reseting value on TODO box, focuses on it, and
submit upon hitting enter key
Resets tag if there's a value
Abstracted out from 4 javascript files!
*/
function reset_form(selector) {
	const todo = `${selector} [name*=todo]`
	const tag = `${selector} [name*=tag_list]`
	$(todo).val("");
	$(todo).focus();
	submit_enter(todo);
	if (element_exist(tag)){
		$(tag).val("");
		submit_enter(tag);
	} else {};
}

function element_exist(selector) {
	return $(`${selector}`.length > 0)
}

function submit_enter(selector) {
	$(selector).keypress(function(event) {
		if(event.which == 13) {
			$(this).trigger('submit.rails');
		}
	});
}

$(document).on("turbolinks:load",function () {
	// Subtasks
	$("section#subtasks").hide();
	reset_form("#task_form");
})


