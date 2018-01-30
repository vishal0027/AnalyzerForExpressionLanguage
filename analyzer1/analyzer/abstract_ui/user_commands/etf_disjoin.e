note
	description: ""
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	ETF_DISJOIN
inherit
	ETF_DISJOIN_INTERFACE
		redefine disjoin end
create
	make
feature -- command
	disjoin
    	do
			-- perform some update on the model state
			model.disjoin
			etf_cmd_container.on_change.notify ([Current])
    	end

end
