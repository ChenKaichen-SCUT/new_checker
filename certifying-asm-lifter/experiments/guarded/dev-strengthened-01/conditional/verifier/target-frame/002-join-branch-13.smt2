; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-11 () (_ BitVec 2))
(assert
 (let ((?x1813 ((_ extract 1 1) p0-join-read-11)))
(let (($x207 (= ?x1813 (_ bv0 1))))
(let (($x5477 (= (not (and (distinct (_ bv0 1) ?x1813) true)) $x207)))
(not $x5477)))))
(check-sat)
