; benchmark generated from python API
(set-info :status unknown)
(declare-fun |object:x| () (_ BitVec 64))
(assert
 (let (($x30 (=> true (= |object:x| |object:x|))))
(not $x30)))
(check-sat)
