; benchmark generated from python API
(set-info :status unknown)
(declare-fun u0 () (_ BitVec 32))
(assert
 (let ((?x46 (bvadd (_ bv0 32) u0)))
(let (($x161 (= u0 ?x46)))
(not $x161))))
(check-sat)
