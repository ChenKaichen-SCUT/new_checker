; benchmark generated from python API
(set-info :status unknown)
(declare-fun |object:x| () (_ BitVec 64))
(assert
 (let (($x40 (=> true (= |object:x| |object:x|))))
(not $x40)))
(check-sat)
