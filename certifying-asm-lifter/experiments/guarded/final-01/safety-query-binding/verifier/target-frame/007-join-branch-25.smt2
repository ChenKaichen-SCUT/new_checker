; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-23 () (_ BitVec 2))
(assert
 (let ((?x6849 ((_ extract 1 1) p0-join-read-23)))
(let (($x3651 (= ?x6849 (_ bv0 1))))
(let (($x751 (= (not (and (distinct (_ bv0 1) ?x6849) true)) $x3651)))
(not $x751)))))
(check-sat)
