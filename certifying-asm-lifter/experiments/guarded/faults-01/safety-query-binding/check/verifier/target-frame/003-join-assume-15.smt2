; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-11 () (_ BitVec 2))
(assert
 (let ((?x1945 ((_ extract 0 0) p0-join-read-11)))
(let (($x3718 (= ?x1945 (_ bv0 1))))
(let (($x5156 (= (not (and (distinct (_ bv0 1) ?x1945) true)) $x3718)))
(not $x5156)))))
(check-sat)
