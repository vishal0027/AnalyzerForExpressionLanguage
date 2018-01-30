note
	description: "Summary description for {EXPRESSION_SET_CLOSE_TAG}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	EXPRESSION_SET_CLOSE_TAG

inherit
	EXPRESSION
		redefine
			out,is_nil,is_empty_node
		end
create
	make_set_close_tag

feature
	make_set_close_tag
		do

		end
feature
	out: STRING
		do
			create Result.make_from_string ("__END_SET_TAG__")
		end

	is_nil: BOOLEAN
		do
			Result := false
		end

	is_empty_node: BOOLEAN
		do
			Result := false
		end
end
