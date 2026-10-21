; benchmark generated from python API
(set-info :status unknown)
(declare-fun u0 () (_ BitVec 32))
(assert
 (let ((?x26 (bvadd (_ bv0 32) u0)))
(let (($x73 (= u0 ?x26)))
(not $x73))))
(check-sat)
