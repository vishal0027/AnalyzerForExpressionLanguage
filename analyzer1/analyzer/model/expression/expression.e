note
	description: "Summary description for {EXPRESSION}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	EXPRESSION

inherit
	ANY
		redefine
			out, is_equal
		end
create
	make

feature -- Public
	make
		do

		end


feature {NONE}
	nca: NIL_COUNTER_ACCESS
	ma: MESSAGE_ACCESS

feature
	out: STRING
		do
			create Result.make_from_string(nca.m.out)
		end

	is_equal(other: like Current): BOOLEAN
		do
			Result := other.is_empty_node
		end

	is_nil: BOOLEAN
		do
			Result := true
		end

	-- By default, this is an empty node
	is_empty_node: BOOLEAN
		do
			Result := true
		end

	is_type_correct: BOOLEAN
		do
			Result := false
		end

	set_expression (e:EXPRESSION)
		do
			-- need to optimize
		end

	get_type: STRING
		do
			create Result.make_from_string("VOID")
		end

	get_evaluated: EXPRESSION
		do
			Result := Current
		end
end
