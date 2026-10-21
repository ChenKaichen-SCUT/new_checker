; benchmark generated from python API
(set-info :status unknown)
(declare-fun |object:input_a| () (_ BitVec 64))
(assert
 (let (($x101 (= |object:input_a| |object:input_a|)))
(not $x101)))
(check-sat)
