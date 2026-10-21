; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-23 () (_ BitVec 2))
(assert
 (let ((?x1509 ((_ extract 1 1) p0-join-read-23)))
(let (($x1825 (= ?x1509 (_ bv0 1))))
(let (($x404 (= (not (and (distinct (_ bv0 1) ?x1509) true)) $x1825)))
(not $x404)))))
(check-sat)
