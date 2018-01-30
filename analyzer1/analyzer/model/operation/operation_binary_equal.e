note
	description: "Summary description for {OPERATION_BINARY_EQUAL}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	OPERATION_BINARY_EQUAL

inherit
	OPERATION_BINARY
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
			create Result.make_from_string("=")
		end

	check_expression_type(left_expression, right_expression: EXPRESSION):BOOLEAN
		do
			Result := left_expression.get_type ~ right_expression.get_type
		end

	result_type(left_expression, right_expression: EXPRESSION):STRING
		do
			create Result.make_from_string ("BOOLEAN")
		end

	evaluate(left_expression, right_expression: EXPRESSION):EXPRESSION
		do
			Result := create {EXPRESSION_BOOLEAN_CONSTANT}.make_boolean(left_expression.is_equal (right_expression))
		end
end
