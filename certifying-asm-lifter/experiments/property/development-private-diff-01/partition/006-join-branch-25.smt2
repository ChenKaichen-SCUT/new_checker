; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-23 () (_ BitVec 2))
(assert
 (let ((?x25 ((_ extract 1 1) p0-join-read-23)))
(let (($x76 (= ?x25 (_ bv0 1))))
(let (($x77 (= (not (and (distinct (_ bv0 1) ?x25) true)) $x76)))
(not $x77)))))
(check-sat)
