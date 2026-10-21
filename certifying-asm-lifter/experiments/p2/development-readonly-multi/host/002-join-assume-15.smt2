; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-11 () (_ BitVec 2))
(assert
 (let ((?x475 ((_ extract 0 0) p0-join-read-11)))
(let (($x101 (= ?x475 (_ bv0 1))))
(let (($x235 (= (not (and (distinct (_ bv0 1) ?x475) true)) $x101)))
(not $x235)))))
(check-sat)
