note
	description: "Summary description for {EXPRESSION_UNARY_OP}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	EXPRESSION_UNARY_OP

inherit
	EXPRESSION
		redefine
			out,is_equal,is_nil,is_empty_node,is_type_correct,set_expression,get_type,get_evaluated
		end

create
	make_unary_op

feature {EXPRESSION_UNARY_OP}
	operation: OPERATION_UNARY
	right_expression: EXPRESSION

feature -- Public
	make_unary_op (o: OPERATION_UNARY)
		do
			operation := o
			right_expression := create {EXPRESSION_PLACEHOLDER}.make_placeholder
		end

feature -- Redefine
	out: STRING
		do
			create Result.make_from_string ("(" + operation.out + " " + right_expression.out + ")")
		end


	is_equal(other: like Current): BOOLEAN
		do
			Result :=
				other.right_expression.get_type.is_equal (Current.right_expression.get_type) and then
				other.right_expression.get_evaluated.is_equal (Current.right_expression.get_evaluated) and then
				other.operation.is_equal (Current.operation)
		end

	is_nil: BOOLEAN
		do
			Result := right_expression.is_nil
		end

	is_empty_node: BOOLEAN
		do
			Result := false
		end

	is_type_correct: BOOLEAN
		do
			Result :=
				right_expression.is_type_correct and
				operation.check_expression_type (right_expression)
		end

	set_expression (e:EXPRESSION)
		do
			right_expression.set_expression (e)
		end

	get_type: STRING
		do
			create Result.make_from_string(operation.result_type (right_expression))
		end

	get_evaluated: EXPRESSION
		do
			Result := operation.evaluate (right_expression.get_evaluated)
		end
end
