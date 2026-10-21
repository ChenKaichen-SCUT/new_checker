; benchmark generated from python API
(set-info :status unknown)
(declare-fun |object:x| () (_ BitVec 64))
(assert
 (let (($x32 (= |object:x| |object:x|)))
(not $x32)))
(check-sat)
