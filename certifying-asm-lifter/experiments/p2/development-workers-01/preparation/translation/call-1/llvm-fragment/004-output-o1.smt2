; benchmark generated from python API
(set-info :status unknown)
(declare-fun u0 () (_ BitVec 32))
(assert
 (let ((?x47 (bvadd (_ bv0 32) u0)))
(let (($x37 (= u0 ?x47)))
(not $x37))))
(check-sat)
