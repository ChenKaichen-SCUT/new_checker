; benchmark generated from python API
(set-info :status unknown)
(declare-fun |object:x| () (_ BitVec 64))
(assert
 (let (($x53 (=> true (= |object:x| |object:x|))))
(not $x53)))
(check-sat)
