; benchmark generated from python API
(set-info :status unknown)
(declare-fun u0 () (_ BitVec 32))
(assert
 (let ((?x110 (bvadd (_ bv0 32) u0)))
(let (($x105 (= u0 ?x110)))
(not $x105))))
(check-sat)
