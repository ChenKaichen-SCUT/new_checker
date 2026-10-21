; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-11 () (_ BitVec 2))
(assert
 (let ((?x2972 ((_ extract 1 1) p0-join-read-11)))
(let (($x2935 (= ?x2972 (_ bv0 1))))
(let (($x2029 (= (not (and (distinct (_ bv0 1) ?x2972) true)) $x2935)))
(not $x2029)))))
(check-sat)
