; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-11 () (_ BitVec 2))
(assert
 (let ((?x22 ((_ extract 0 0) p0-join-read-11)))
(let (($x21 (= ?x22 (_ bv0 1))))
(let (($x37 (= (not (and (distinct (_ bv0 1) ?x22) true)) $x21)))
(not $x37)))))
(check-sat)
