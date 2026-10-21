; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-11 () (_ BitVec 2))
(assert
 (let ((?x2144 ((_ extract 0 0) p0-join-read-11)))
(let (($x2525 (= ?x2144 (_ bv0 1))))
(let (($x963 (= (not (and (distinct (_ bv0 1) ?x2144) true)) $x2525)))
(not $x963)))))
(check-sat)
