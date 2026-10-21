; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-11 () (_ BitVec 2))
(assert
 (let ((?x54 (bvand p0-join-read-11 (_ bv1 2))))
(let (($x139 (= ?x54 ?x54)))
(not $x139))))
(check-sat)
