; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-11 () (_ BitVec 2))
(assert
 (let ((?x4528 ((_ extract 1 1) p0-join-read-11)))
(let (($x4781 (= ?x4528 (_ bv0 1))))
(let (($x3297 (= (not (and (distinct (_ bv0 1) ?x4528) true)) $x4781)))
(not $x3297)))))
(check-sat)
