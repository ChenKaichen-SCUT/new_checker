; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-11 () (_ BitVec 2))
(assert
 (let ((?x40 ((_ extract 0 0) p0-join-read-11)))
(let (($x445 (= ?x40 (_ bv0 1))))
(let (($x28 (= (not (and (distinct (_ bv0 1) ?x40) true)) $x445)))
(not $x28)))))
(check-sat)
