; benchmark generated from python API
(set-info :status unknown)
(declare-fun u0 () (_ BitVec 32))
(assert
 (let ((?x42 (bvadd (_ bv0 32) u0)))
(let (($x58 (= u0 ?x42)))
(not $x58))))
(check-sat)
