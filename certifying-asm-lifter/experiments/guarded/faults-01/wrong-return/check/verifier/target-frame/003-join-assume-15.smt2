; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-11 () (_ BitVec 2))
(assert
 (let ((?x84 ((_ extract 0 0) p0-join-read-11)))
(let (($x5728 (= ?x84 (_ bv0 1))))
(let (($x224 (= (not (and (distinct (_ bv0 1) ?x84) true)) $x5728)))
(not $x224)))))
(check-sat)
