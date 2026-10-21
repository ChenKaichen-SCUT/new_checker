; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-11 () (_ BitVec 2))
(assert
 (let ((?x5156 ((_ extract 0 0) p0-join-read-11)))
(let (($x1021 (= ?x5156 (_ bv0 1))))
(let (($x98 (= (not (and (distinct (_ bv0 1) ?x5156) true)) $x1021)))
(not $x98)))))
(check-sat)
