note
	description: "Summary description for {EXPRESSION_PLACEHOLDER}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	EXPRESSION_PLACEHOLDER

inherit
	EXPRESSION
		redefine
			out,is_equal,is_nil,is_empty_node,is_type_correct,set_expression,get_type,get_evaluated
		end

create
	make_placeholder

feature {EXPRESSION_PLACEHOLDER}
	expression: EXPRESSION

feature -- Public
	make_placeholder
		do
			expression := create {EXPRESSION}.make
		end

	get_expression: EXPRESSION
		do
			Result := expression;
		end

feature -- Redefine
	out: STRING
		do
			create Result.make_from_string (expression.out)
		end

	is_equal(other: like Current): BOOLEAN
		do
			Result :=
				other.get_type.is_equal (Current.get_type) and then
				other.get_evaluated.is_equal (Current.get_evaluated)
		end

	is_nil: BOOLEAN
		do
			Result := expression.is_nil
		end

	is_empty_node: BOOLEAN
		do
			Result := expression.is_empty_node
		end

	is_type_correct: BOOLEAN
		do
			Result := (not expression.is_nil) and then (expression.is_type_correct)
		end

	set_expression (e:EXPRESSION)
		do
			if is_empty_node then
				if nca.m.is_first then
					if attached {EXPRESSION_SET_CLOSE_TAG} e then
						ma.m.set_message ("Error (Set enumeration is not being specified).")
					else
						expression := e
					end
				end
			else
				expression.set_expression (e)
			end
		end

	get_type: STRING
		do
			create Result.make_from_string (expression.get_type)
		end

	get_evaluated: EXPRESSION
		do
			Result := expression.get_evaluated
		end
end
