; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-23 () (_ BitVec 2))
(assert
 (let ((?x8669 ((_ extract 1 1) p0-join-read-23)))
(let (($x5751 (= ?x8669 (_ bv0 1))))
(let (($x1218 (= (not (and (distinct (_ bv0 1) ?x8669) true)) $x5751)))
(not $x1218)))))
(check-sat)
