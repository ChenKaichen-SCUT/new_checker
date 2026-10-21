; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-11 () (_ BitVec 2))
(assert
 (let ((?x60 ((_ extract 1 1) p0-join-read-11)))
(let (($x94 (= ?x60 (_ bv0 1))))
(let (($x91 (= (not (and (distinct (_ bv0 1) ?x60) true)) $x94)))
(not $x91)))))
(check-sat)
