; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-23 () (_ BitVec 2))
(assert
 (let ((?x1194 ((_ extract 0 0) p0-join-read-23)))
(let (($x1184 (= ?x1194 (_ bv0 1))))
(let (($x1738 (= (not (and (distinct (_ bv0 1) ?x1194) true)) $x1184)))
(not $x1738)))))
(check-sat)
