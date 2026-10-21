; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-23 () (_ BitVec 2))
(assert
 (let ((?x100 ((_ extract 0 0) p0-join-read-23)))
(let (($x2472 (= ?x100 (_ bv0 1))))
(let (($x163 (= (not (and (distinct (_ bv0 1) ?x100) true)) $x2472)))
(not $x163)))))
(check-sat)
