note
	description: ""
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	ETF_THERE_EXISTS
inherit
	ETF_THERE_EXISTS_INTERFACE
		redefine there_exists end
create
	make
feature -- command
	there_exists
    	do
			-- perform some update on the model state
			model.there_exists
			etf_cmd_container.on_change.notify ([Current])
    	end

end
