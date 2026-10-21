; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-11 () (_ BitVec 2))
(assert
 (let ((?x403 ((_ extract 0 0) p0-join-read-11)))
(let (($x1509 (= ?x403 (_ bv0 1))))
(let (($x1425 (= (not (and (distinct (_ bv0 1) ?x403) true)) $x1509)))
(not $x1425)))))
(check-sat)
