note
	description: "Summary description for {NIL_COUNTER_ACCESS}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

expanded class
	NIL_COUNTER_ACCESS

feature
	m: NIL_COUNTER
		once
			create Result.make
		end

invariant
	m = m

end
