; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-11 () (_ BitVec 2))
(assert
 (let ((?x923 ((_ extract 0 0) p0-join-read-11)))
(let (($x385 (= ?x923 (_ bv0 1))))
(let (($x2810 (= (not (and (distinct (_ bv0 1) ?x923) true)) $x385)))
(not $x2810)))))
(check-sat)
