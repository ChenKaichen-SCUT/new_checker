; benchmark generated from python API
(set-info :status unknown)
(declare-fun u0 () (_ BitVec 32))
(assert
 (let ((?x1312 (bvadd (_ bv0 32) u0)))
(let (($x1918 (= u0 ?x1312)))
(not $x1918))))
(check-sat)
