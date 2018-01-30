note
	description: "Summary description for {ANALYZER}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	ANALYZER

inherit
	ANY
		redefine
			out
		end

create {ANALYZER_ACCESS}
	make

feature {NONE} -- Attribute
	root: EXPRESSION
	message: STRING
	nca: NIL_COUNTER_ACCESS
	ma: MESSAGE_ACCESS

feature {NONE} -- Initialization
	make
			-- Initialization for `Current'.
		do
			root := create {EXPRESSION_PLACEHOLDER}.make_placeholder
			message := "Expression is initialized."

--			-- !!! Debug
--			test_output := ""
--			test_exp := create {EXPRESSION}.make
--			test_exp := create {EXPRESSION_INTEGER_CONSTANT}.make_digit (3)
--			test_exp := create {EXPRESSION_BOOLEAN_CONSTANT}.make_boolean (false)
--			test_exp := create {EXPRESSION_BINARY_OP}.make_binary_op (create {OPERATION_BINARY_PLUS}.make)
--			test_exp := create {EXPRESSION_UNARY_OP}.make_unary_op (create {OPERATION_UNARY_NEGATIVE}.make)
--			test_exp := create {EXPRESSION_SET_ENUMERATION}.make_set_enumeration


		end

-- feature -- Debug use feature
--	-- !!! remove in production environment !!!
--	test_output : STRING
--	test_exp : EXPRESSION


feature -- default model operations
	-- These two features must be implemented.
	default_update
			-- Perform update to the model state.
		do
			message := "Undefined Operation."
		end

	reset
			-- Reset model state.
		do
			if (attached {EXPRESSION_PLACEHOLDER} root as r) and then (r.is_empty_node) then
				message:= "Error (Initial expression cannot be reset)."
			else
				root := create {EXPRESSION_PLACEHOLDER}.make_placeholder
				message:= "OK."
			end
 		end

feature -- fundermental features
	type_check
		do
			if root.is_nil then
				message := "Error (Expression is not yet fully specified)."
			elseif not root.is_type_correct then
				message := root.out + " is not type-correct."
			else
				message := root.out + " is type-correct."
			end
		end

	evaluate
		do
			if root.is_nil then
				message := "Error (Expression is not yet fully specified)."
			elseif not root.is_type_correct then
				message := "Error (Expression is not type-correct)."
			else
				ma.m.reset -- hacking on the messages system. may need to improve
				nca.m.touch
				message := root.get_evaluated.out
				if ma.m.out /~ "OK." then
					message := ma.m.out
				end
			end
		end

feature -- events of user adding constants
	boolean_constant(c: BOOLEAN)
		do
			ma.m.reset
			check attached {EXPRESSION_PLACEHOLDER} root as r then
				--r.set_boolean (c)
				r.set_expression (create {EXPRESSION_BOOLEAN_CONSTANT}.make_boolean (c))
			end
			message := ma.m.out
		end

	integer_constant(c: INTEGER_64)
		do
			ma.m.reset
			check attached {EXPRESSION_PLACEHOLDER} root as r then
				--r.set_integer (c)
				r.set_expression (create {EXPRESSION_INTEGER_CONSTANT}.make_digit (c))
			end
			message := ma.m.out
		end

feature -- real supported method

	add
		do
			ma.m.reset
			check attached {EXPRESSION_PLACEHOLDER} root as r then
				r.set_expression (create {EXPRESSION_BINARY_OP}.make_binary_op (create {OPERATION_BINARY_PLUS}.make))
			end
			message := ma.m.out
		end

	subtract
		do
			ma.m.reset
			check attached {EXPRESSION_PLACEHOLDER} root as r then
				r.set_expression (create {EXPRESSION_BINARY_OP}.make_binary_op (create {OPERATION_BINARY_MINUS}.make))
			end
			message := ma.m.out
		end

	multiply
		do
			ma.m.reset
			check attached {EXPRESSION_PLACEHOLDER} root as r then
				r.set_expression (create {EXPRESSION_BINARY_OP}.make_binary_op (create {OPERATION_BINARY_TIMES}.make))
			end
			message := ma.m.out
		end

	divide
		do
			ma.m.reset
			check attached {EXPRESSION_PLACEHOLDER} root as r then
				r.set_expression (create {EXPRESSION_BINARY_OP}.make_binary_op (create {OPERATION_BINARY_DIVIDES}.make))
			end
			message := ma.m.out
		end

feature
	conjoin
		do
			ma.m.reset
			check attached {EXPRESSION_PLACEHOLDER} root as r then
				r.set_expression (create {EXPRESSION_BINARY_OP}.make_binary_op (create {OPERATION_BINARY_AND}.make))
			end
			message := ma.m.out
		end

	disjoin
		do
			ma.m.reset
			check attached {EXPRESSION_PLACEHOLDER} root as r then
				r.set_expression (create {EXPRESSION_BINARY_OP}.make_binary_op (create {OPERATION_BINARY_OR}.make))
			end
			message := ma.m.out
		end

	imply
		do
			ma.m.reset
			check attached {EXPRESSION_PLACEHOLDER} root as r then
				r.set_expression (create {EXPRESSION_BINARY_OP}.make_binary_op (create {OPERATION_BINARY_IMPLIES}.make))
			end
			message := ma.m.out
		end

feature
	equals
		do
			ma.m.reset
			check attached {EXPRESSION_PLACEHOLDER} root as r then
				r.set_expression (create {EXPRESSION_BINARY_OP}.make_binary_op (create {OPERATION_BINARY_EQUAL}.make))
			end
			message := ma.m.out
		end

	greater_than
		do
			ma.m.reset
			check attached {EXPRESSION_PLACEHOLDER} root as r then
				r.set_expression (create {EXPRESSION_BINARY_OP}.make_binary_op (create {OPERATION_BINARY_GT}.make))
			end
			message := ma.m.out
		end


	less_than
		do
			ma.m.reset
			check attached {EXPRESSION_PLACEHOLDER} root as r then
				r.set_expression (create {EXPRESSION_BINARY_OP}.make_binary_op (create {OPERATION_BINARY_LT}.make))
			end
			message := ma.m.out
		end

feature
	union
		do
			ma.m.reset
			check attached {EXPRESSION_PLACEHOLDER} root as r then
				r.set_expression (create {EXPRESSION_BINARY_OP}.make_binary_op (create {OPERATION_BINARY_UNION}.make))
			end
			message := ma.m.out
		end

	intersect
		do
			ma.m.reset
			check attached {EXPRESSION_PLACEHOLDER} root as r then
				r.set_expression (create {EXPRESSION_BINARY_OP}.make_binary_op (create {OPERATION_BINARY_INTERSECT}.make))
			end
			message := ma.m.out
		end

	difference
		do
			ma.m.reset
			check attached {EXPRESSION_PLACEHOLDER} root as r then
				r.set_expression (create {EXPRESSION_BINARY_OP}.make_binary_op (create {OPERATION_BINARY_DIFFERENCE}.make))
			end
			message := ma.m.out
		end

feature
	negative
		do
			ma.m.reset
			check attached {EXPRESSION_PLACEHOLDER} root as r then
				r.set_expression (create {EXPRESSION_UNARY_OP}.make_unary_op (create {OPERATION_UNARY_NEGATIVE}.make))
			end
			message := ma.m.out
		end


feature
	negation
		do
			ma.m.reset
			check attached {EXPRESSION_PLACEHOLDER} root as r then
				r.set_expression (create {EXPRESSION_UNARY_OP}.make_unary_op (create {OPERATION_UNARY_NEGATION}.make))
			end
			message := ma.m.out
		end

feature
	sum
		do
			ma.m.reset
			check attached {EXPRESSION_PLACEHOLDER} root as r then
				r.set_expression (create {EXPRESSION_UNARY_OP}.make_unary_op (create {OPERATION_UNARY_SUM}.make))
			end
			message := ma.m.out
		end

	for_all
		do
			ma.m.reset
			check attached {EXPRESSION_PLACEHOLDER} root as r then
				r.set_expression (create {EXPRESSION_UNARY_OP}.make_unary_op (create {OPERATION_UNARY_FORALL}.make))
			end
			message := ma.m.out
		end

	there_exists
		do
			ma.m.reset
			check attached {EXPRESSION_PLACEHOLDER} root as r then
				r.set_expression (create {EXPRESSION_UNARY_OP}.make_unary_op (create {OPERATION_UNARY_EXISTS}.make))
			end
			message := ma.m.out
		end

feature -- set features
	open_set_enumeration
		do
			ma.m.reset
			check attached {EXPRESSION_PLACEHOLDER} root as r then
				r.set_expression (create {EXPRESSION_SET_ENUMERATION}.make_set_enumeration)
			end
			message := ma.m.out
		end

	close_set_enumeration
		do
			ma.m.reset
			check attached {EXPRESSION_PLACEHOLDER} root as r then
				r.set_expression (create {EXPRESSION_SET_CLOSE_TAG}.make_set_close_tag)
			end
			message := ma.m.out
		end

feature -- queries
	out: STRING
		local
			buffer: STRING
		do
			nca.m.reset
			create buffer.make_from_string ("")
			buffer := buffer + "  Expression currently specified: "
			buffer := buffer + root.out
			buffer := buffer + "%N"
			buffer := buffer + "  Report: "
			buffer := buffer + message
			--buffer := buffer + "%N"
			Result := buffer
		end
end
