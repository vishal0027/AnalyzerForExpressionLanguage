note
	description: "Summary description for {OPERATION_UNARY_NEGATION}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	OPERATION_UNARY_NEGATION

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
			create Result.make_from_string("!")
		end

	check_expression_type(right_argument: EXPRESSION):BOOLEAN
		do
			Result := right_argument.get_type ~ "BOOLEAN"
		end


	result_type(right_expression: EXPRESSION):STRING
		do
			create Result.make_from_string ("BOOLEAN")
		end

	evaluate(right_argument: EXPRESSION):EXPRESSION
		local
			a: BOOLEAN
		do
			check attached {EXPRESSION_BOOLEAN_CONSTANT} right_argument as ra then
				a := ra.get_boolean
			end
			Result := create {EXPRESSION_BOOLEAN_CONSTANT}.make_boolean (not a)
		end
end
