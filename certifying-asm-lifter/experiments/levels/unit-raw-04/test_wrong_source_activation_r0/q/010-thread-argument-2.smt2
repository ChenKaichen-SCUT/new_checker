; benchmark generated from python API
(set-info :status unknown)
(declare-fun |object:input_a| () (_ BitVec 64))
(declare-fun |object:input_b| () (_ BitVec 64))
(assert
 (let (($x43 (= |object:input_b| |object:input_a|)))
(not $x43)))
(check-sat)
