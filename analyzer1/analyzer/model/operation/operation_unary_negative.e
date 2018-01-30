note
	description: "Summary description for {OPERATION_UNARY_NEGATIVE}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	OPERATION_UNARY_NEGATIVE

inherit
	OPERATION_UNARY
		redefine
			out,check_expression_type,result_type,evaluate
		end

create
	make

feature
	make
		do

		end

feature
	out: STRING
		do
			create Result.make_from_string("-")
		end

	check_expression_type(right_argument: EXPRESSION):BOOLEAN
		do
			Result := right_argument.get_type ~ "INTEGER"
		end


	result_type(right_expression: EXPRESSION):STRING
		do
			create Result.make_from_string ("INTEGER")
		end

	evaluate(right_argument: EXPRESSION):EXPRESSION
		local
			a: INTEGER_64
		do
			check attached {EXPRESSION_INTEGER_CONSTANT} right_argument as ra then
				a := ra.get_integer
			end
			Result := create {EXPRESSION_INTEGER_CONSTANT}.make_digit (- a)
		end
end
