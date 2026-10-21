; benchmark generated from python API
(set-info :status unknown)
(declare-fun u0 () (_ BitVec 32))
(assert
 (let ((?x1191 (bvadd (_ bv0 32) u0)))
(let (($x1194 (= u0 ?x1191)))
(not $x1194))))
(check-sat)
