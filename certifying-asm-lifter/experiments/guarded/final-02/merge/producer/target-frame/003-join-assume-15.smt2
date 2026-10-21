; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-11 () (_ BitVec 2))
(assert
 (let ((?x79 ((_ extract 0 0) p0-join-read-11)))
(let (($x61 (= ?x79 (_ bv0 1))))
(let (($x68 (= (not (and (distinct (_ bv0 1) ?x79) true)) $x61)))
(not $x68)))))
(check-sat)
