note
	description: ""
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	ETF_NEGATIVE
inherit
	ETF_NEGATIVE_INTERFACE
		redefine negative end
create
	make
feature -- command
	negative
    	do
			-- perform some update on the model state
			model.negative
			etf_cmd_container.on_change.notify ([Current])
    	end

end
