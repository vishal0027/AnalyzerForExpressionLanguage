note
	description: "Summary description for {OPERATION}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	OPERATION
inherit
	ANY
		redefine
			out,is_equal
		end

feature
	ma: MESSAGE_ACCESS

feature
	out: STRING
		do
			create Result.make_from_string("__OPERATION__")
		end

	is_equal(other: like Current): BOOLEAN
		do
			Result := other.out ~ Current.out
		end

end
