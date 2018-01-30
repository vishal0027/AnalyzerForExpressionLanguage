note
	description: "Summary description for {OPERATION_BINARY_TIMES}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	OPERATION_BINARY_TIMES


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
			create Result.make_from_string("*")
		end

	check_expression_type(left_expression, right_expression: EXPRESSION):BOOLEAN
		do
			Result := (left_expression.get_type ~ right_expression.get_type) and (right_expression.get_type ~ "INTEGER")
		end

	result_type(left_expression, right_expression: EXPRESSION):STRING
		do
			create Result.make_from_string ("INTEGER")
		end

	evaluate(left_expression, right_expression: EXPRESSION):EXPRESSION
		local
			a,b :INTEGER_64
		do
			check attached {EXPRESSION_INTEGER_CONSTANT} left_expression as lexp then
				a := lexp.get_integer
			end
			check attached {EXPRESSION_INTEGER_CONSTANT} right_expression as rexp then
				b := rexp.get_integer
			end
			Result := create {EXPRESSION_INTEGER_CONSTANT}.make_digit (a * b)
		end

end
