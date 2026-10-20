; benchmark generated from python API
(set-info :status unknown)
(declare-fun |object:x| () (_ BitVec 64))
(declare-fun u0 () (_ BitVec 32))
(assert
 (let (($x14 (= u0 (_ bv0 32))))
(let (($x40 (=> $x14 (= |object:x| |object:x|))))
(not $x40))))
(check-sat)
