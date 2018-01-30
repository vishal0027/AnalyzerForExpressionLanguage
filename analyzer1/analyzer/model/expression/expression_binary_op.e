note
	description: "Summary description for {EXPRESSION_BINARY_OP}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	EXPRESSION_BINARY_OP

inherit
	EXPRESSION
		redefine
			out,is_equal,is_nil,is_empty_node,is_type_correct,set_expression,get_type,get_evaluated
		end

create
	make_binary_op

feature {EXPRESSION_BINARY_OP}
	operation: OPERATION_BINARY
	left_expression: EXPRESSION
	right_expression: EXPRESSION

feature -- Public
	make_binary_op (o: OPERATION_BINARY)
		do
			operation := o
			left_expression := create {EXPRESSION_PLACEHOLDER}.make_placeholder
			right_expression := create {EXPRESSION_PLACEHOLDER}.make_placeholder
		end

feature -- Redefine
	out: STRING
		do
			create Result.make_from_string ("(" + left_expression.out + " " + operation.out + " " + right_expression.out + ")")
		end

	is_equal(other: like Current): BOOLEAN
		do
			Result :=
				other.left_expression.get_type.is_equal (Current.left_expression.get_type) and then
				other.right_expression.get_type.is_equal (Current.right_expression.get_type) and then
				other.left_expression.get_evaluated.is_equal (Current.left_expression.get_evaluated) and then
				other.right_expression.get_evaluated.is_equal (Current.right_expression.get_evaluated) and then
				other.operation.is_equal (Current.operation)
		end

	is_nil: BOOLEAN
		do
			Result := left_expression.is_nil or right_expression.is_nil
		end

	is_empty_node: BOOLEAN
		do
			Result := false
		end

	is_type_correct: BOOLEAN
		do
			Result :=
				left_expression.is_type_correct and right_expression.is_type_correct and
				operation.check_expression_type (left_expression, right_expression)
		end

	set_expression (e:EXPRESSION)
		do
			left_expression.set_expression (e)
			right_expression.set_expression (e)
		end

	get_type: STRING
		do
			create Result.make_from_string(operation.result_type (left_expression, right_expression))
		end

	get_evaluated: EXPRESSION
		do
			Result := operation.evaluate (left_expression.get_evaluated, right_expression.get_evaluated)
		end
end
