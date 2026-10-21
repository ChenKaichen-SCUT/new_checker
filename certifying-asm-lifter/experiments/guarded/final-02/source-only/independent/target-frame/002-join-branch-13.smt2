; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-11 () (_ BitVec 2))
(assert
 (let ((?x3651 ((_ extract 1 1) p0-join-read-11)))
(let (($x4884 (= ?x3651 (_ bv0 1))))
(let (($x3655 (= (not (and (distinct (_ bv0 1) ?x3651) true)) $x4884)))
(not $x3655)))))
(check-sat)
