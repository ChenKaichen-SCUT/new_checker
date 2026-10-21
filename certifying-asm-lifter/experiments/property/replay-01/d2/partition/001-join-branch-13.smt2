; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-11 () (_ BitVec 2))
(assert
 (let ((?x742 ((_ extract 1 1) p0-join-read-11)))
(let (($x723 (= ?x742 (_ bv0 1))))
(let (($x721 (= (not (and (distinct (_ bv0 1) ?x742) true)) $x723)))
(not $x721)))))
(check-sat)
