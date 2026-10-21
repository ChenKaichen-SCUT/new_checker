; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-23 () (_ BitVec 2))
(assert
 (let ((?x11 ((_ extract 1 1) p0-join-read-23)))
(let (($x35 (= ?x11 (_ bv0 1))))
(let (($x16 (= (not (and (distinct (_ bv0 1) ?x11) true)) $x35)))
(not $x16)))))
(check-sat)
