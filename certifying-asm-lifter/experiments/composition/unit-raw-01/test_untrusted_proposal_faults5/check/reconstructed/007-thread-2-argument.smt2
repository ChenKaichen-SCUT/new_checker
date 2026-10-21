; benchmark generated from python API
(set-info :status unknown)
(declare-fun |object:input_b| () (_ BitVec 64))
(assert
 (let (($x64 (= |object:input_b| |object:input_b|)))
(not $x64)))
(check-sat)
