; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-11 () (_ BitVec 2))
(assert
 (let ((?x81 ((_ extract 1 1) p0-join-read-11)))
(let (($x84 (= ?x81 (_ bv0 1))))
(let (($x82 (= (not (and (distinct (_ bv0 1) ?x81) true)) $x84)))
(not $x82)))))
(check-sat)
