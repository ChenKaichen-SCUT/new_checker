; benchmark generated from python API
(set-info :status unknown)
(declare-fun u0 () (_ BitVec 32))
(assert
 (let ((?x407 (bvadd (_ bv0 32) u0)))
(let (($x1718 (= u0 ?x407)))
(not $x1718))))
(check-sat)
