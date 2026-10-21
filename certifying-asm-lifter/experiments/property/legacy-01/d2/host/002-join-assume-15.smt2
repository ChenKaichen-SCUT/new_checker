; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-11 () (_ BitVec 2))
(assert
 (let ((?x25 ((_ extract 0 0) p0-join-read-11)))
(let (($x64 (= ?x25 (_ bv0 1))))
(let (($x65 (= (not (and (distinct (_ bv0 1) ?x25) true)) $x64)))
(not $x65)))))
(check-sat)
