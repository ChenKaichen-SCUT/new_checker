; benchmark generated from python API
(set-info :status unknown)
(declare-fun u0 () (_ BitVec 32))
(assert
 (let ((?x260 (bvadd (_ bv0 32) u0)))
(let (($x196 (= u0 ?x260)))
(not $x196))))
(check-sat)
