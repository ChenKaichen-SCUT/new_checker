; benchmark generated from python API
(set-info :status unknown)
(declare-fun u0 () (_ BitVec 32))
(assert
 (let ((?x2683 (bvadd (_ bv0 32) u0)))
(let (($x2906 (= u0 ?x2683)))
(not $x2906))))
(check-sat)
