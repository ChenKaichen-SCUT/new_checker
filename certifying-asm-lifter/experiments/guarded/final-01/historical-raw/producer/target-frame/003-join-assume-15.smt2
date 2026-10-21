; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-11 () (_ BitVec 2))
(assert
 (let ((?x8743 ((_ extract 0 0) p0-join-read-11)))
(let (($x110 (= ?x8743 (_ bv0 1))))
(let (($x4880 (= (not (and (distinct (_ bv0 1) ?x8743) true)) $x110)))
(not $x4880)))))
(check-sat)
