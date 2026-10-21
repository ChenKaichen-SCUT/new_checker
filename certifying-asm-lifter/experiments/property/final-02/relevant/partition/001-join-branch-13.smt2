; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-11 () (_ BitVec 2))
(assert
 (let ((?x79 ((_ extract 1 1) p0-join-read-11)))
(let (($x82 (= ?x79 (_ bv0 1))))
(let (($x80 (= (not (and (distinct (_ bv0 1) ?x79) true)) $x82)))
(not $x80)))))
(check-sat)
