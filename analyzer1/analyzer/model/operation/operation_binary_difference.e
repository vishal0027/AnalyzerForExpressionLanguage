note
	description: "Summary description for {OPERATION_BINARY_DIFFERENCE}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	OPERATION_BINARY_DIFFERENCE

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
			create Result.make_from_string("\")
		end

	check_expression_type(left_expression, right_expression: EXPRESSION):BOOLEAN
		do
			Result := (left_expression.get_type ~ right_expression.get_type) and (right_expression.get_type.head (4).is_equal ("SET("))
		end

	result_type(left_expression, right_expression: EXPRESSION):STRING
		do
			create Result.make_from_string (left_expression.get_type)
		end

	evaluate(left_expression, right_expression: EXPRESSION):EXPRESSION
		local
			a,b :EXPRESSION_SET_ENUMERATION
		do
			check attached {EXPRESSION_SET_ENUMERATION} left_expression as lexp then
				a := lexp
			end
			check attached {EXPRESSION_SET_ENUMERATION} right_expression as rexp then
				b := rexp
			end
			Result := a.difference (b)
		end

end
