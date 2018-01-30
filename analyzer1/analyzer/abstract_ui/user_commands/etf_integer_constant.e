note
	description: ""
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	ETF_INTEGER_CONSTANT
inherit
	ETF_INTEGER_CONSTANT_INTERFACE
		redefine integer_constant end
create
	make
feature -- command
	integer_constant(c: INTEGER_64)
    	do
			-- perform some update on the model state
			model.integer_constant (c)
			etf_cmd_container.on_change.notify ([Current])
    	end

end
