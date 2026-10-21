; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-23 () (_ BitVec 2))
(assert
 (let ((?x6997 ((_ extract 1 1) p0-join-read-23)))
(let (($x1018 (= ?x6997 (_ bv0 1))))
(let (($x6926 (= (not (and (distinct (_ bv0 1) ?x6997) true)) $x1018)))
(not $x6926)))))
(check-sat)
