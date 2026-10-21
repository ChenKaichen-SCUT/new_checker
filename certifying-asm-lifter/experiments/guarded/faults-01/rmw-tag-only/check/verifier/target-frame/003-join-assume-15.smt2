; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-11 () (_ BitVec 2))
(assert
 (let ((?x21 ((_ extract 0 0) p0-join-read-11)))
(let (($x6997 (= ?x21 (_ bv0 1))))
(let (($x5958 (= (not (and (distinct (_ bv0 1) ?x21) true)) $x6997)))
(not $x5958)))))
(check-sat)
