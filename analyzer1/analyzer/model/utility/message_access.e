note
	description: "Summary description for {MESSAGE_ACCESS}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

expanded class
	MESSAGE_ACCESS

feature
	m: MESSAGE
		once
			create Result.make
		end

invariant
	m = m

end
