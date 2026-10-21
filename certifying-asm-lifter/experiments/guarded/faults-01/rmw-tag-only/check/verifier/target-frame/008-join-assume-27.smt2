; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-23 () (_ BitVec 2))
(assert
 (let ((?x101 ((_ extract 0 0) p0-join-read-23)))
(let (($x7367 (= ?x101 (_ bv0 1))))
(let (($x63 (= (not (and (distinct (_ bv0 1) ?x101) true)) $x7367)))
(not $x63)))))
(check-sat)
