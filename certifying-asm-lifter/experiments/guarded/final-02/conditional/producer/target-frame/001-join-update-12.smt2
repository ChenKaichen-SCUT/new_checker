; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-11 () (_ BitVec 2))
(assert
 (let ((?x2844 (bvand p0-join-read-11 (_ bv1 2))))
(let (($x246 (= ?x2844 ?x2844)))
(not $x246))))
(check-sat)
