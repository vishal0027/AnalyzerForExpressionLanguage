note
	description: "Summary description for {NIL_COUNTER}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	NIL_COUNTER

inherit
	ANY
	redefine
		out
	end

create {NIL_COUNTER_ACCESS}
	make

feature {NONE}
	first:BOOLEAN
	make
		do
		end

feature
	reset
		do
			first := true
		end

	out: STRING
		do
			if first then
				create Result.make_from_string("?");
				first := false
			else
				create Result.make_from_string("nil");
			end
		end

	is_first: BOOLEAN
		-- no output version of feature "out"
		do
			Result := first
			first := false
		end

	touch
		-- no output and no return value version of feature "out"
		do
			first := false
		end

	is_mission_success: BOOLEAN
		do
			Result := not first
		end

end
