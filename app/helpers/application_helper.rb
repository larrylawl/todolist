module ApplicationHelper
	# Object --> String
	def get_status(object)
		if object.completed == 1
			"checked"
		else 
			"unchecked"
		end
	end
end
