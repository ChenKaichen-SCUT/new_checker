; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-11 () (_ BitVec 2))
(assert
 (let ((?x883 ((_ extract 0 0) p0-join-read-11)))
(let (($x831 (= ?x883 (_ bv0 1))))
(let (($x3214 (= (not (and (distinct (_ bv0 1) ?x883) true)) $x831)))
(not $x3214)))))
(check-sat)
