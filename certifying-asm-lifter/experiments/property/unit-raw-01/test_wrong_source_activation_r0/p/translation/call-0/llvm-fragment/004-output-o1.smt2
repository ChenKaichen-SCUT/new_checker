; benchmark generated from python API
(set-info :status unknown)
(declare-fun u0 () (_ BitVec 32))
(assert
 (let ((?x86 (bvadd (_ bv0 32) u0)))
(let (($x20 (= u0 ?x86)))
(not $x20))))
(check-sat)
