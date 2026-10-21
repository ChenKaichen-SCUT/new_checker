; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-11 () (_ BitVec 2))
(assert
 (let ((?x37 ((_ extract 1 1) p0-join-read-11)))
(let (($x31 (= ?x37 (_ bv0 1))))
(let (($x1700 (= (not (and (distinct (_ bv0 1) ?x37) true)) $x31)))
(not $x1700)))))
(check-sat)
