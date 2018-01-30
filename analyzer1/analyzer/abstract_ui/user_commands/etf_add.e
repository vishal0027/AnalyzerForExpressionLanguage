note
	description: ""
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	ETF_ADD
inherit
	ETF_ADD_INTERFACE
		redefine add end
create
	make
feature -- command
	add
    	do
			-- perform some update on the model state
			model.add
			etf_cmd_container.on_change.notify ([Current])
    	end

end
