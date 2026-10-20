; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-23 () (_ BitVec 2))
(assert
 (let ((?x53 ((_ extract 0 0) p0-join-read-23)))
(let (($x18 (= ?x53 (_ bv0 1))))
(let (($x11 (= (not (and (distinct (_ bv0 1) ?x53) true)) $x18)))
(not $x11)))))
(check-sat)
