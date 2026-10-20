; benchmark generated from python API
(set-info :status unknown)
(declare-fun |object:x| () (_ BitVec 64))
(declare-fun u0 () (_ BitVec 32))
(assert
 (let (($x73 (= u0 (_ bv0 32))))
(let (($x37 (=> $x73 (= |object:x| |object:x|))))
(not $x37))))
(check-sat)
