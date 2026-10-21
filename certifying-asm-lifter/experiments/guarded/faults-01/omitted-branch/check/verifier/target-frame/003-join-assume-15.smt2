; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-11 () (_ BitVec 2))
(assert
 (let ((?x2438 ((_ extract 0 0) p0-join-read-11)))
(let (($x8634 (= ?x2438 (_ bv0 1))))
(let (($x3682 (= (not (and (distinct (_ bv0 1) ?x2438) true)) $x8634)))
(not $x3682)))))
(check-sat)
