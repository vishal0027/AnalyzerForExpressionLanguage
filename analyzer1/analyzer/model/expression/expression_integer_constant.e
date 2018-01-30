note
	description: "Summary description for {EXP_INTEGER_CONSTANT}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	EXPRESSION_INTEGER_CONSTANT

inherit
	EXPRESSION
		redefine
			out,is_equal,is_nil,is_empty_node,is_type_correct,set_expression,get_type
		end

create
	make_digit

feature {EXPRESSION_INTEGER_CONSTANT}
	digit: INTEGER_64

feature -- Public
	make_digit (d:INTEGER_64)
		do
			digit := d
		end

feature -- Redefine
	out: STRING
		do
			create Result.make_from_string (digit.out)
		end

	is_equal(other: like Current): BOOLEAN
		do
			Result := other.digit.is_equal (Current.digit)
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
			create Result.make_from_string("INTEGER")
		end

	get_integer: INTEGER_64
		do
			Result := digit
		end
end
