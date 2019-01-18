module ApplicationHelper
	# Returns "checked" if object's completed attribute equals 1,
	# and "unchecked" otherwise.
	def get_status(object)
		if object.completed == 1
			"checked"
		else 
			"unchecked"
		end
	end
end
