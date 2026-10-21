; benchmark generated from python API
(set-info :status unknown)
(declare-fun u0 () (_ BitVec 32))
(assert
 (let ((?x64 (bvadd (_ bv0 32) u0)))
(let (($x103 (= u0 ?x64)))
(not $x103))))
(check-sat)
