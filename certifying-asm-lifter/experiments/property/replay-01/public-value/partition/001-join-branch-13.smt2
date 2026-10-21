; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-11 () (_ BitVec 2))
(assert
 (let ((?x741 ((_ extract 1 1) p0-join-read-11)))
(let (($x733 (= ?x741 (_ bv0 1))))
(let (($x527 (= (not (and (distinct (_ bv0 1) ?x741) true)) $x733)))
(not $x527)))))
(check-sat)
