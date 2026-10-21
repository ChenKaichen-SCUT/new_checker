; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-23 () (_ BitVec 2))
(assert
 (let ((?x65 ((_ extract 0 0) p0-join-read-23)))
(let (($x63 (= ?x65 (_ bv0 1))))
(let (($x46 (= (not (and (distinct (_ bv0 1) ?x65) true)) $x63)))
(not $x46)))))
(check-sat)
