; benchmark generated from python API
(set-info :status unknown)
(declare-fun |object:x| () (_ BitVec 64))
(assert
 (let (($x100 (= |object:x| |object:x|)))
(not $x100)))
(check-sat)
