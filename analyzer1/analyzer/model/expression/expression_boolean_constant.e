note
	description: "Summary description for {EXP_BOOLEAN_CONSTANT}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	EXPRESSION_BOOLEAN_CONSTANT

inherit
	EXPRESSION
		redefine
			out,is_equal,is_nil,is_empty_node,is_type_correct,set_expression,get_type
		end

create
	make_boolean

feature {EXPRESSION_BOOLEAN_CONSTANT}
	true_or_false: BOOLEAN

feature -- Public
	make_boolean (b:BOOLEAN)
		do
			true_or_false := b
		end

feature -- Redefine
	out: STRING
		do
			create Result.make_from_string (true_or_false.out)
		end

	is_equal(other: like Current): BOOLEAN
		do
			Result := other.true_or_false = Current.true_or_false
		end

	is_nil: BOOLEAN
		do
			Result := false
		end

	is_empty_node: BOOLEAN
		do
			Result := false
		end

	is_type_correct: BOOLEAN
		do
			Result := true
		end

	set_expression (e:EXPRESSION)
		do
			-- need to optimize
		end

	get_type: STRING
		do
			create Result.make_from_string("BOOLEAN")
		end

	get_boolean: BOOLEAN
		do
			Result := true_or_false
		end
end
