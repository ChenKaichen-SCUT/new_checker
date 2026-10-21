; benchmark generated from python API
(set-info :status unknown)
(declare-fun u0 () (_ BitVec 32))
(assert
 (let ((?x8 (bvadd (_ bv0 32) u0)))
(let (($x33 (= u0 ?x8)))
(not $x33))))
(check-sat)
