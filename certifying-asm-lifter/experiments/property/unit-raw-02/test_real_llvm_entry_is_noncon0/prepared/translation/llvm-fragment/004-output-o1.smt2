; benchmark generated from python API
(set-info :status unknown)
(declare-fun u0 () (_ BitVec 32))
(assert
 (let ((?x6 (bvadd (_ bv0 32) u0)))
(let (($x29 (= u0 ?x6)))
(not $x29))))
(check-sat)
