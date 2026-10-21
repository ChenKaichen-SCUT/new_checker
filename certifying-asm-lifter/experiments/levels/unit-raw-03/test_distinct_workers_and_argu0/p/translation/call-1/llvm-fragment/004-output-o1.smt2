; benchmark generated from python API
(set-info :status unknown)
(declare-fun u0 () (_ BitVec 32))
(assert
 (let ((?x67 (bvadd (_ bv0 32) u0)))
(let (($x64 (= u0 ?x67)))
(not $x64))))
(check-sat)
