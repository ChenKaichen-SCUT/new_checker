; benchmark generated from python API
(set-info :status unknown)
(declare-fun u0 () (_ BitVec 32))
(assert
 (let ((?x248 (bvadd (_ bv0 32) u0)))
(let (($x25 (= u0 ?x248)))
(not $x25))))
(check-sat)
