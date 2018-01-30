note
	description: "Summary description for {EXPRESSION_SET_ENUMERATION}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	EXPRESSION_SET_ENUMERATION

inherit
	EXPRESSION
		redefine
			out,is_equal,is_nil,is_empty_node,is_type_correct,set_expression,get_type,get_evaluated
		end

create
	make_set_enumeration

feature {EXPRESSION_SET_ENUMERATION}
	set: ARRAYED_LIST[EXPRESSION]
	completed: BOOLEAN

	close_set
		do
			if not completed then
				completed := true
			end
		end

feature -- Public
	make_set_enumeration
		do
			completed := false
			set := create {ARRAYED_LIST[EXPRESSION]}.make (0)
			set.compare_objects
			set.force (create {EXPRESSION_PLACEHOLDER}.make_placeholder)
		end

feature -- Redefine
	out: STRING
		local
			temp: STRING
			upper: INTEGER
		do
			if completed then
				upper := set.upper - 1
			else
				upper := set.upper
			end

			create temp.make_empty

			across
				1 |..| upper as cursor
			loop
				temp := temp + set[cursor.item].out + ", "
			end

			temp.remove_tail (2)
			create Result.make_from_string ("{"+temp+"}")
		end

	is_equal(other: like Current): BOOLEAN
		do
			Result :=
				other.completed and then
				Current.completed and then
				other.set.count = Current.set.count and then
				other.get_type.is_equal (Current.get_type) and then
				across
					1 |..| (other.set.upper - 1) as i
				all
					across
						1 |..| (Current.set.upper - 1) as j
					some
						other.set.i_th (i.item).get_evaluated.is_equal (Current.set.i_th (j.item).get_evaluated)
					end
				end
				and then
				across
					1 |..| (Current.set.upper - 1) as i
				all
					across
						1 |..| (other.set.upper - 1) as j
					some
						Current.set.i_th (i.item).get_evaluated.is_equal (other.set.i_th (j.item).get_evaluated)
					end
				end
		end

	is_nil: BOOLEAN
		do
			Result := set[set.upper].is_nil and (not completed)
		end

	is_empty_node: BOOLEAN
		do
			Result := false
		end

	is_type_correct: BOOLEAN
		do
			if is_nil then
				Result := false
			else
				Result := across
					1 |..| (set.upper-1) as i
				all
					set.i_th (1).is_type_correct and set.i_th (i.item).is_type_correct and
					set.i_th (1).get_type ~ set.i_th (i.item).get_type
				end
			end

		end

	set_expression (e:EXPRESSION)
		do
			-- WARNING!! Sending a empty node means closing the set enumulation.
			-- Touch nca sending that this command is successfully accepted.
			if not completed then
				if set[set.upper].is_empty_node then
					if (attached {EXPRESSION_SET_CLOSE_TAG} e) then
						if (set.upper = 1) then
							-- Should have at least one element in the set	
							ma.m.set_failure_message ("Error: (Set enumeration must be non-empty).")
						else
							nca.m.touch
							close_set
						end
					else
						set[set.upper].set_expression (e)
						if not set[set.upper].is_nil then
							set.force (create {EXPRESSION_PLACEHOLDER}.make_placeholder)
						end
					end
				elseif not set[set.upper].is_empty_node  then
					set[set.upper].set_expression (e)
					if not set[set.upper].is_nil then
						set.force (create {EXPRESSION_PLACEHOLDER}.make_placeholder)
					end
				end
			end
		end

	get_type: STRING
		do
			create Result.make_from_string("SET(" + set[set.lower].get_type + ")")
		end

	get_evaluated: EXPRESSION
		local
			exp: EXPRESSION
		do
			-- Precondition: the set should be completed. But I dont know if it is good to implement this precondition
			-- Copy set element from temp and set it to Result
			Result := create {EXPRESSION_SET_ENUMERATION}.make_set_enumeration
			check attached {EXPRESSION_SET_ENUMERATION} result as r then
				r.set.make (0)
				-- Check Repeats
				across
					1 |..| (set.upper - 1) as i
				loop
					exp := set.i_th (i.item).get_evaluated
					if across r.set as cursor all not cursor.item.get_evaluated.is_equal(exp) end then
						r.set.force (exp)
					end
				end
				r.set.force (create {EXPRESSION_SET_CLOSE_TAG}.make_set_close_tag)
				r.close_set
			end
		end

	union(other : like Current): EXPRESSION
		local
			exp: EXPRESSION
		do
			Result := create {EXPRESSION_SET_ENUMERATION}.make_set_enumeration
			check attached {EXPRESSION_SET_ENUMERATION} result as r then
				r.set.make (0)
				-- Check Repeats
				across
					1 |..| (set.upper - 1) as i
				loop
					exp := set.i_th (i.item).get_evaluated
					if across r.set as cursor all not cursor.item.get_evaluated.is_equal(exp) end then
						r.set.force (exp)
					end
				end
				across
					1 |..| (other.set.upper - 1) as i
				loop
					exp := other.set.i_th (i.item).get_evaluated
					if across r.set as cursor all not cursor.item.get_evaluated.is_equal(exp) end then
						r.set.force (exp)
					end
				end
				r.set.force (create {EXPRESSION_SET_CLOSE_TAG}.make_set_close_tag)
				r.close_set
			end
		end


	intersect(other : like Current): EXPRESSION
		local
			exp: EXPRESSION
		do
			Result := create {EXPRESSION_SET_ENUMERATION}.make_set_enumeration
			check attached {EXPRESSION_SET_ENUMERATION} result as r then
				r.set.make (0)
				-- Check Repeats
				across
					1 |..| (set.upper - 1) as i
				loop
					exp := set.i_th (i.item).get_evaluated
					if
						across r.set as cursor all not cursor.item.get_evaluated.is_equal(exp) end and then
						across 1 |..| (other.set.upper - 1) as cursor some other.set.i_th (cursor.item).get_evaluated.is_equal (exp)  end
					then
						r.set.force (exp)
					end
				end
				r.set.force (create {EXPRESSION_SET_CLOSE_TAG}.make_set_close_tag)
				r.close_set
			end
		end

	difference(other : like Current): EXPRESSION
		local
			exp: EXPRESSION
		do
			Result := create {EXPRESSION_SET_ENUMERATION}.make_set_enumeration
			check attached {EXPRESSION_SET_ENUMERATION} result as r then
				r.set.make (0)
				-- Check Repeats
				across
					1 |..| (set.upper - 1) as i
				loop
					exp := set.i_th (i.item).get_evaluated
					if
						across r.set as cursor all not cursor.item.get_evaluated.is_equal(exp) end and then
						across 1 |..| (other.set.upper - 1) as cursor all not other.set.i_th (cursor.item).get_evaluated.is_equal (exp)  end
					then
						r.set.force (exp)
					end
				end

				r.set.force (create {EXPRESSION_SET_CLOSE_TAG}.make_set_close_tag)
				r.close_set
			end
		end

feature {OPERATION}
	get_list: ARRAYED_LIST[EXPRESSION]
		do
			Result := set
		end

end
