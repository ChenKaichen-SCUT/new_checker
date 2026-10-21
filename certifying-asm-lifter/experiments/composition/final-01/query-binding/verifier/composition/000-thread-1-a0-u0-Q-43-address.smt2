; benchmark generated from python API
(set-info :status unknown)
(declare-fun |object:input_a| () (_ BitVec 64))
(assert
 (let (($x10 (= |object:input_a| |object:input_a|)))
(not $x10)))
(check-sat)
