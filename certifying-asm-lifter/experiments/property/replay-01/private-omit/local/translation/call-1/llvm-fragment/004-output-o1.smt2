; benchmark generated from python API
(set-info :status unknown)
(declare-fun u0 () (_ BitVec 32))
(assert
 (let ((?x723 (bvadd (_ bv0 32) u0)))
(let (($x749 (= u0 ?x723)))
(not $x749))))
(check-sat)
