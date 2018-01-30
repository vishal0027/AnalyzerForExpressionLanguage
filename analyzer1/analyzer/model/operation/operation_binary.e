note
	description: "Summary description for {OP_BINARY}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	OPERATION_BINARY

inherit
	OPERATION
		redefine
			out
		end

feature
	out: STRING
		do
			create Result.make_from_string("__BinaryOp__")
		end

	check_expression_type(left_expression, right_expression: EXPRESSION):BOOLEAN
		do
			Result := false
		end

	result_type(left_expression, right_expression: EXPRESSION):STRING
		do
			create Result.make_from_string ("VOID")
		end

	evaluate(left_expression, right_expression: EXPRESSION):EXPRESSION
		do
			create Result.make
		end
end
