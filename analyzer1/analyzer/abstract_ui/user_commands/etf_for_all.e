note
	description: ""
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	ETF_FOR_ALL
inherit
	ETF_FOR_ALL_INTERFACE
		redefine for_all end
create
	make
feature -- command
	for_all
    	do
			-- perform some update on the model state
			model.for_all
			etf_cmd_container.on_change.notify ([Current])
    	end

end
