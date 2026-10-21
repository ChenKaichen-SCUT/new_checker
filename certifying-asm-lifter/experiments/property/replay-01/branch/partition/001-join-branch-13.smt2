; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-11 () (_ BitVec 2))
(assert
 (let ((?x372 ((_ extract 1 1) p0-join-read-11)))
(let (($x571 (= ?x372 (_ bv0 1))))
(let (($x524 (= (not (and (distinct (_ bv0 1) ?x372) true)) $x571)))
(not $x524)))))
(check-sat)
