; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-11 () (_ BitVec 2))
(assert
 (let ((?x7679 ((_ extract 0 0) p0-join-read-11)))
(let (($x5540 (= ?x7679 (_ bv0 1))))
(let (($x6926 (= (not (and (distinct (_ bv0 1) ?x7679) true)) $x5540)))
(not $x6926)))))
(check-sat)
