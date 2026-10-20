; benchmark generated from python API
(set-info :status unknown)
(declare-fun |object:x| () (_ BitVec 64))
(declare-fun u0 () (_ BitVec 32))
(assert
 (let (($x11 (= u0 (_ bv0 32))))
(let (($x66 (=> $x11 (= |object:x| |object:x|))))
(not $x66))))
(check-sat)
