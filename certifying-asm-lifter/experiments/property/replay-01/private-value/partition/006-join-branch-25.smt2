; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-23 () (_ BitVec 2))
(assert
 (let ((?x722 ((_ extract 1 1) p0-join-read-23)))
(let (($x731 (= ?x722 (_ bv0 1))))
(let (($x404 (= (not (and (distinct (_ bv0 1) ?x722) true)) $x731)))
(not $x404)))))
(check-sat)
