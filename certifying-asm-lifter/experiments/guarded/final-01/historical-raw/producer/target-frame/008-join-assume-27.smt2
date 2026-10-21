; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-23 () (_ BitVec 2))
(assert
 (let ((?x571 ((_ extract 0 0) p0-join-read-23)))
(let (($x8725 (= ?x571 (_ bv0 1))))
(let (($x1750 (= (not (and (distinct (_ bv0 1) ?x571) true)) $x8725)))
(not $x1750)))))
(check-sat)
