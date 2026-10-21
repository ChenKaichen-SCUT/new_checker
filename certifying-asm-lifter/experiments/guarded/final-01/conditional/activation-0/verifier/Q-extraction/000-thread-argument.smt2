; benchmark generated from python API
(set-info :status unknown)
(declare-fun |object:input_a| () (_ BitVec 64))
(assert
 (let (($x63 (= |object:input_a| |object:input_a|)))
(not $x63)))
(check-sat)
