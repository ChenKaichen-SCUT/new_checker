; benchmark generated from python API
(set-info :status unknown)
(declare-fun u0 () (_ BitVec 32))
(assert
 (let ((?x200 (bvadd (_ bv0 32) u0)))
(let (($x197 (= u0 ?x200)))
(not $x197))))
(check-sat)
