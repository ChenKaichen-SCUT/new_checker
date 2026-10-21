; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-11 () (_ BitVec 2))
(assert
 (let ((?x8200 ((_ extract 0 0) p0-join-read-11)))
(let (($x870 (= ?x8200 (_ bv0 1))))
(let (($x30 (= (not (and (distinct (_ bv0 1) ?x8200) true)) $x870)))
(not $x30)))))
(check-sat)
