; benchmark generated from python API
(set-info :status unknown)
(declare-fun u0 () (_ BitVec 32))
(assert
 (let ((?x35 (bvadd (_ bv0 32) u0)))
(let (($x41 (= u0 ?x35)))
(not $x41))))
(check-sat)
