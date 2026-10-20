; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-23 () (_ BitVec 2))
(assert
 (let ((?x63 ((_ extract 1 1) p0-join-read-23)))
(let (($x38 (= ?x63 (_ bv0 1))))
(let (($x59 (= (not (and (distinct (_ bv0 1) ?x63) true)) $x38)))
(not $x59)))))
(check-sat)
