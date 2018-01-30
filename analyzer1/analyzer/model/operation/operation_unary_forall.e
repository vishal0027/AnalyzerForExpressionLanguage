note
	description: "Summary description for {OPERATION_UNARY_FORALL}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	OPERATION_UNARY_FORALL

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
			create Result.make_from_string("&&")
		end

	check_expression_type(right_argument: EXPRESSION):BOOLEAN
		do
			Result := right_argument.get_type ~ "SET(BOOLEAN)"
		end


	result_type(right_expression: EXPRESSION):STRING
		do
			create Result.make_from_string ("BOOLEAN")
		end

	evaluate(right_argument: EXPRESSION):EXPRESSION
		local
			a: BOOLEAN
		do
			a := true
			check attached {EXPRESSION_SET_ENUMERATION} right_argument as ra then
				across
					ra.get_list as i
				loop
					if attached {EXPRESSION_BOOLEAN_CONSTANT} i.item as element then
						a := a and element.get_boolean
					end
				end
			end
			Result := create {EXPRESSION_BOOLEAN_CONSTANT}.make_boolean (a)
		end
end
