; benchmark generated from python API
(set-info :status unknown)
(declare-fun |object:x| () (_ BitVec 64))
(assert
 (let (($x10 (=> true (= |object:x| |object:x|))))
(not $x10)))
(check-sat)
