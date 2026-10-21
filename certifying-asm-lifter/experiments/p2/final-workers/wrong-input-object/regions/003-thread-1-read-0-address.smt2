; benchmark generated from python API
(set-info :status unknown)
(declare-fun |object:input_a| () (_ BitVec 64))
(declare-fun |object:x| () (_ BitVec 64))
(assert
 (let (($x29 (= |object:x| |object:input_a|)))
(not $x29)))
(check-sat)
