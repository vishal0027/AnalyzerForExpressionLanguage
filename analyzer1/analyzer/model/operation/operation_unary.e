note
	description: "Summary description for {OP_UNARY}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	OPERATION_UNARY

inherit
	OPERATION
		redefine
			out
		end

feature
	out: STRING
		do
			create Result.make_from_string("__UnaryOp__")
		end

	check_expression_type(right_argument: EXPRESSION):BOOLEAN
		do
			Result := false
		end

	result_type(right_expression: EXPRESSION):STRING
		do
			create Result.make_from_string ("VOID")
		end

	evaluate(right_argument: EXPRESSION):EXPRESSION
		do
			create Result.make
		end
end
