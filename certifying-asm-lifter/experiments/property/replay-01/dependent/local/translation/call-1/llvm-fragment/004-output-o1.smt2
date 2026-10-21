; benchmark generated from python API
(set-info :status unknown)
(declare-fun u0 () (_ BitVec 32))
(assert
 (let ((?x557 (bvadd (_ bv0 32) u0)))
(let (($x328 (= u0 ?x557)))
(not $x328))))
(check-sat)
