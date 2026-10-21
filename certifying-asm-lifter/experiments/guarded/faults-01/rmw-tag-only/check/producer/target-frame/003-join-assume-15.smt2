; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-11 () (_ BitVec 2))
(assert
 (let ((?x6836 ((_ extract 0 0) p0-join-read-11)))
(let (($x4630 (= ?x6836 (_ bv0 1))))
(let (($x5592 (= (not (and (distinct (_ bv0 1) ?x6836) true)) $x4630)))
(not $x5592)))))
(check-sat)
