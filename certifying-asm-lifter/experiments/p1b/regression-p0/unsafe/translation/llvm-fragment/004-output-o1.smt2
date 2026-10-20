; benchmark generated from python API
(set-info :status unknown)
(declare-fun u0 () (_ BitVec 32))
(assert
 (let ((?x9 (bvadd (_ bv0 32) u0)))
(let (($x6 (= u0 ?x9)))
(not $x6))))
(check-sat)
