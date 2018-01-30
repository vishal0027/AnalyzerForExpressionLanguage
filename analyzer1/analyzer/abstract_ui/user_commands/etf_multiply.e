note
	description: ""
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	ETF_MULTIPLY
inherit
	ETF_MULTIPLY_INTERFACE
		redefine multiply end
create
	make
feature -- command
	multiply
    	do
			-- perform some update on the model state
			model.multiply
			etf_cmd_container.on_change.notify ([Current])
    	end

end
