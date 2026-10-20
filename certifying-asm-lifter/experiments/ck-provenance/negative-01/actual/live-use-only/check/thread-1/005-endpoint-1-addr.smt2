; benchmark generated from python API
(set-info :status unknown)
(declare-fun |object:x| () (_ BitVec 64))
(assert
 (let (($x21 (=> true (= |object:x| |object:x|))))
(not $x21)))
(check-sat)
