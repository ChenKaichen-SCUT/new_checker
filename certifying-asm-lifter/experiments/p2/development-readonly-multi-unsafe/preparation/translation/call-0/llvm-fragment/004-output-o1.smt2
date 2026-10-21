; benchmark generated from python API
(set-info :status unknown)
(declare-fun u0 () (_ BitVec 32))
(assert
 (let ((?x1194 (bvadd (_ bv0 32) u0)))
(let (($x1197 (= u0 ?x1194)))
(not $x1197))))
(check-sat)
