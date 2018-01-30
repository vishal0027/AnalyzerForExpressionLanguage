class
 	 ETF_TYPE_CONSTRAINTS
feature -- list of enumeratd constants
	enum_items : HASH_TABLE[INTEGER, STRING]
		do
			create Result.make (10)
		end

	enum_items_inverse : HASH_TABLE[STRING, INTEGER_64]
		do
			create Result.make (10)
		end
feature -- query on declarations of event parameters
	evt_param_types_table : HASH_TABLE[HASH_TABLE[ETF_PARAM_TYPE, STRING], STRING]
		local
			type_check_param_types: HASH_TABLE[ETF_PARAM_TYPE, STRING]
			evaluate_param_types: HASH_TABLE[ETF_PARAM_TYPE, STRING]
			reset_param_types: HASH_TABLE[ETF_PARAM_TYPE, STRING]
			boolean_constant_param_types: HASH_TABLE[ETF_PARAM_TYPE, STRING]
			integer_constant_param_types: HASH_TABLE[ETF_PARAM_TYPE, STRING]
			add_param_types: HASH_TABLE[ETF_PARAM_TYPE, STRING]
			subtract_param_types: HASH_TABLE[ETF_PARAM_TYPE, STRING]
			multiply_param_types: HASH_TABLE[ETF_PARAM_TYPE, STRING]
			divide_param_types: HASH_TABLE[ETF_PARAM_TYPE, STRING]
			conjoin_param_types: HASH_TABLE[ETF_PARAM_TYPE, STRING]
			disjoin_param_types: HASH_TABLE[ETF_PARAM_TYPE, STRING]
			imply_param_types: HASH_TABLE[ETF_PARAM_TYPE, STRING]
			equals_param_types: HASH_TABLE[ETF_PARAM_TYPE, STRING]
			greater_than_param_types: HASH_TABLE[ETF_PARAM_TYPE, STRING]
			less_than_param_types: HASH_TABLE[ETF_PARAM_TYPE, STRING]
			union_param_types: HASH_TABLE[ETF_PARAM_TYPE, STRING]
			intersect_param_types: HASH_TABLE[ETF_PARAM_TYPE, STRING]
			difference_param_types: HASH_TABLE[ETF_PARAM_TYPE, STRING]
			negative_param_types: HASH_TABLE[ETF_PARAM_TYPE, STRING]
			negation_param_types: HASH_TABLE[ETF_PARAM_TYPE, STRING]
			sum_param_types: HASH_TABLE[ETF_PARAM_TYPE, STRING]
			for_all_param_types: HASH_TABLE[ETF_PARAM_TYPE, STRING]
			there_exists_param_types: HASH_TABLE[ETF_PARAM_TYPE, STRING]
			open_set_enumeration_param_types: HASH_TABLE[ETF_PARAM_TYPE, STRING]
			close_set_enumeration_param_types: HASH_TABLE[ETF_PARAM_TYPE, STRING]
		do
			create Result.make (10)
			Result.compare_objects
			create type_check_param_types.make (10)
			type_check_param_types.compare_objects
			Result.extend (type_check_param_types, "type_check")
			create evaluate_param_types.make (10)
			evaluate_param_types.compare_objects
			Result.extend (evaluate_param_types, "evaluate")
			create reset_param_types.make (10)
			reset_param_types.compare_objects
			Result.extend (reset_param_types, "reset")
			create boolean_constant_param_types.make (10)
			boolean_constant_param_types.compare_objects
			boolean_constant_param_types.extend (create {ETF_BOOL_PARAM}, "c")
			Result.extend (boolean_constant_param_types, "boolean_constant")
			create integer_constant_param_types.make (10)
			integer_constant_param_types.compare_objects
			integer_constant_param_types.extend (create {ETF_INT_PARAM}, "c")
			Result.extend (integer_constant_param_types, "integer_constant")
			create add_param_types.make (10)
			add_param_types.compare_objects
			Result.extend (add_param_types, "add")
			create subtract_param_types.make (10)
			subtract_param_types.compare_objects
			Result.extend (subtract_param_types, "subtract")
			create multiply_param_types.make (10)
			multiply_param_types.compare_objects
			Result.extend (multiply_param_types, "multiply")
			create divide_param_types.make (10)
			divide_param_types.compare_objects
			Result.extend (divide_param_types, "divide")
			create conjoin_param_types.make (10)
			conjoin_param_types.compare_objects
			Result.extend (conjoin_param_types, "conjoin")
			create disjoin_param_types.make (10)
			disjoin_param_types.compare_objects
			Result.extend (disjoin_param_types, "disjoin")
			create imply_param_types.make (10)
			imply_param_types.compare_objects
			Result.extend (imply_param_types, "imply")
			create equals_param_types.make (10)
			equals_param_types.compare_objects
			Result.extend (equals_param_types, "equals")
			create greater_than_param_types.make (10)
			greater_than_param_types.compare_objects
			Result.extend (greater_than_param_types, "greater_than")
			create less_than_param_types.make (10)
			less_than_param_types.compare_objects
			Result.extend (less_than_param_types, "less_than")
			create union_param_types.make (10)
			union_param_types.compare_objects
			Result.extend (union_param_types, "union")
			create intersect_param_types.make (10)
			intersect_param_types.compare_objects
			Result.extend (intersect_param_types, "intersect")
			create difference_param_types.make (10)
			difference_param_types.compare_objects
			Result.extend (difference_param_types, "difference")
			create negative_param_types.make (10)
			negative_param_types.compare_objects
			Result.extend (negative_param_types, "negative")
			create negation_param_types.make (10)
			negation_param_types.compare_objects
			Result.extend (negation_param_types, "negation")
			create sum_param_types.make (10)
			sum_param_types.compare_objects
			Result.extend (sum_param_types, "sum")
			create for_all_param_types.make (10)
			for_all_param_types.compare_objects
			Result.extend (for_all_param_types, "for_all")
			create there_exists_param_types.make (10)
			there_exists_param_types.compare_objects
			Result.extend (there_exists_param_types, "there_exists")
			create open_set_enumeration_param_types.make (10)
			open_set_enumeration_param_types.compare_objects
			Result.extend (open_set_enumeration_param_types, "open_set_enumeration")
			create close_set_enumeration_param_types.make (10)
			close_set_enumeration_param_types.compare_objects
			Result.extend (close_set_enumeration_param_types, "close_set_enumeration")
		end
feature -- query on declarations of event parameters
	evt_param_types_list : HASH_TABLE[LINKED_LIST[ETF_PARAM_TYPE], STRING]
		local
			type_check_param_types: LINKED_LIST[ETF_PARAM_TYPE]
			evaluate_param_types: LINKED_LIST[ETF_PARAM_TYPE]
			reset_param_types: LINKED_LIST[ETF_PARAM_TYPE]
			boolean_constant_param_types: LINKED_LIST[ETF_PARAM_TYPE]
			integer_constant_param_types: LINKED_LIST[ETF_PARAM_TYPE]
			add_param_types: LINKED_LIST[ETF_PARAM_TYPE]
			subtract_param_types: LINKED_LIST[ETF_PARAM_TYPE]
			multiply_param_types: LINKED_LIST[ETF_PARAM_TYPE]
			divide_param_types: LINKED_LIST[ETF_PARAM_TYPE]
			conjoin_param_types: LINKED_LIST[ETF_PARAM_TYPE]
			disjoin_param_types: LINKED_LIST[ETF_PARAM_TYPE]
			imply_param_types: LINKED_LIST[ETF_PARAM_TYPE]
			equals_param_types: LINKED_LIST[ETF_PARAM_TYPE]
			greater_than_param_types: LINKED_LIST[ETF_PARAM_TYPE]
			less_than_param_types: LINKED_LIST[ETF_PARAM_TYPE]
			union_param_types: LINKED_LIST[ETF_PARAM_TYPE]
			intersect_param_types: LINKED_LIST[ETF_PARAM_TYPE]
			difference_param_types: LINKED_LIST[ETF_PARAM_TYPE]
			negative_param_types: LINKED_LIST[ETF_PARAM_TYPE]
			negation_param_types: LINKED_LIST[ETF_PARAM_TYPE]
			sum_param_types: LINKED_LIST[ETF_PARAM_TYPE]
			for_all_param_types: LINKED_LIST[ETF_PARAM_TYPE]
			there_exists_param_types: LINKED_LIST[ETF_PARAM_TYPE]
			open_set_enumeration_param_types: LINKED_LIST[ETF_PARAM_TYPE]
			close_set_enumeration_param_types: LINKED_LIST[ETF_PARAM_TYPE]
		do
			create Result.make (10)
			Result.compare_objects
			create type_check_param_types.make
			type_check_param_types.compare_objects
			Result.extend (type_check_param_types, "type_check")
			create evaluate_param_types.make
			evaluate_param_types.compare_objects
			Result.extend (evaluate_param_types, "evaluate")
			create reset_param_types.make
			reset_param_types.compare_objects
			Result.extend (reset_param_types, "reset")
			create boolean_constant_param_types.make
			boolean_constant_param_types.compare_objects
			boolean_constant_param_types.extend (create {ETF_BOOL_PARAM})
			Result.extend (boolean_constant_param_types, "boolean_constant")
			create integer_constant_param_types.make
			integer_constant_param_types.compare_objects
			integer_constant_param_types.extend (create {ETF_INT_PARAM})
			Result.extend (integer_constant_param_types, "integer_constant")
			create add_param_types.make
			add_param_types.compare_objects
			Result.extend (add_param_types, "add")
			create subtract_param_types.make
			subtract_param_types.compare_objects
			Result.extend (subtract_param_types, "subtract")
			create multiply_param_types.make
			multiply_param_types.compare_objects
			Result.extend (multiply_param_types, "multiply")
			create divide_param_types.make
			divide_param_types.compare_objects
			Result.extend (divide_param_types, "divide")
			create conjoin_param_types.make
			conjoin_param_types.compare_objects
			Result.extend (conjoin_param_types, "conjoin")
			create disjoin_param_types.make
			disjoin_param_types.compare_objects
			Result.extend (disjoin_param_types, "disjoin")
			create imply_param_types.make
			imply_param_types.compare_objects
			Result.extend (imply_param_types, "imply")
			create equals_param_types.make
			equals_param_types.compare_objects
			Result.extend (equals_param_types, "equals")
			create greater_than_param_types.make
			greater_than_param_types.compare_objects
			Result.extend (greater_than_param_types, "greater_than")
			create less_than_param_types.make
			less_than_param_types.compare_objects
			Result.extend (less_than_param_types, "less_than")
			create union_param_types.make
			union_param_types.compare_objects
			Result.extend (union_param_types, "union")
			create intersect_param_types.make
			intersect_param_types.compare_objects
			Result.extend (intersect_param_types, "intersect")
			create difference_param_types.make
			difference_param_types.compare_objects
			Result.extend (difference_param_types, "difference")
			create negative_param_types.make
			negative_param_types.compare_objects
			Result.extend (negative_param_types, "negative")
			create negation_param_types.make
			negation_param_types.compare_objects
			Result.extend (negation_param_types, "negation")
			create sum_param_types.make
			sum_param_types.compare_objects
			Result.extend (sum_param_types, "sum")
			create for_all_param_types.make
			for_all_param_types.compare_objects
			Result.extend (for_all_param_types, "for_all")
			create there_exists_param_types.make
			there_exists_param_types.compare_objects
			Result.extend (there_exists_param_types, "there_exists")
			create open_set_enumeration_param_types.make
			open_set_enumeration_param_types.compare_objects
			Result.extend (open_set_enumeration_param_types, "open_set_enumeration")
			create close_set_enumeration_param_types.make
			close_set_enumeration_param_types.compare_objects
			Result.extend (close_set_enumeration_param_types, "close_set_enumeration")
		end
feature -- comments for contracts
	comment(etf_s: STRING): BOOLEAN
		do
			Result := TRUE
		end
end
