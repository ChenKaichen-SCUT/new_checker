; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-11 () (_ BitVec 2))
(assert
 (let ((?x4713 ((_ extract 1 1) p0-join-read-11)))
(let (($x5976 (= ?x4713 (_ bv0 1))))
(let (($x2972 (= (not (and (distinct (_ bv0 1) ?x4713) true)) $x5976)))
(not $x2972)))))
(check-sat)
