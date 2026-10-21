; benchmark generated from python API
(set-info :status unknown)
(declare-fun u0 () (_ BitVec 32))
(assert
 (let ((?x34 (bvadd (_ bv0 32) u0)))
(let (($x57 (= u0 ?x34)))
(not $x57))))
(check-sat)
