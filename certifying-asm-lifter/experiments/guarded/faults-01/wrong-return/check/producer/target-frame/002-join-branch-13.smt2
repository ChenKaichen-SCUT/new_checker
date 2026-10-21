; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-11 () (_ BitVec 2))
(assert
 (let ((?x8339 ((_ extract 1 1) p0-join-read-11)))
(let (($x5960 (= ?x8339 (_ bv0 1))))
(let (($x128 (= (not (and (distinct (_ bv0 1) ?x8339) true)) $x5960)))
(not $x128)))))
(check-sat)
