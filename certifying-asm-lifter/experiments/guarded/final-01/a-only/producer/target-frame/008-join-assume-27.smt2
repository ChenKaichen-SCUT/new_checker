; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-23 () (_ BitVec 2))
(assert
 (let ((?x280 ((_ extract 0 0) p0-join-read-23)))
(let (($x4509 (= ?x280 (_ bv0 1))))
(let (($x3965 (= (not (and (distinct (_ bv0 1) ?x280) true)) $x4509)))
(not $x3965)))))
(check-sat)
