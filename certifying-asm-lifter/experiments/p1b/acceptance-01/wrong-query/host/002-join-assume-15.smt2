; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-11 () (_ BitVec 2))
(assert
 (let ((?x18 ((_ extract 0 0) p0-join-read-11)))
(let (($x53 (= ?x18 (_ bv0 1))))
(let (($x50 (= (not (and (distinct (_ bv0 1) ?x18) true)) $x53)))
(not $x50)))))
(check-sat)
