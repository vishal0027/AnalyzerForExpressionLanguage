note
	description: "Summary description for {MESSAGE}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	MESSAGE

inherit
	ANY
	redefine
		out
	end

create {MESSAGE_ACCESS}
	make

feature {NONE}
	nca: NIL_COUNTER_ACCESS
	specified_message: STRING
	failure_message: STRING

feature
	make
		do
			nca.m.reset
			create specified_message.make_from_string("")
			create failure_message.make_from_string("Error (Expression is already fully specified).")
		end

	reset
		do
			make
		end
feature
	out:STRING
		do
			if specified_message /~ "" then
				create Result.make_from_string(specified_message)
			else
				if nca.m.is_mission_success then
					create Result.make_from_string("OK.")
				else
					create Result.make_from_string(failure_message)
				end

			end
		end

	set_message(msg:STRING)
		-- Must be printed out
		do
			create specified_message.make_from_string(msg)
		end

	set_failure_message(msg:STRING)
		-- Will be printed out only if it is a failure
		do
			create failure_message.make_from_string(msg)
		end
end
