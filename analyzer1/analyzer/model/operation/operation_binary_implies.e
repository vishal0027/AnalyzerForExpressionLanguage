note
	description: "Summary description for {OPERATION_BINARY_IMPLIES}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	OPERATION_BINARY_IMPLIES


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
			create Result.make_from_string("=>")
		end

	check_expression_type(left_expression, right_expression: EXPRESSION):BOOLEAN
		do
			Result := (left_expression.get_type ~ right_expression.get_type) and (right_expression.get_type ~ "BOOLEAN")
		end

	result_type(left_expression, right_expression: EXPRESSION):STRING
		do
			create Result.make_from_string ("BOOLEAN")
		end

	evaluate(left_expression, right_expression: EXPRESSION):EXPRESSION
		local
			a,b :BOOLEAN
		do
			check attached {EXPRESSION_BOOLEAN_CONSTANT} left_expression as lexp then
				a := lexp.get_boolean
			end
			check attached {EXPRESSION_BOOLEAN_CONSTANT} right_expression as rexp then
				b := rexp.get_boolean
			end
			Result := create {EXPRESSION_BOOLEAN_CONSTANT}.make_boolean (a implies b)
		end

end
