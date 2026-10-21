; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-11 () (_ BitVec 2))
(assert
 (let ((?x3718 ((_ extract 1 1) p0-join-read-11)))
(let (($x2584 (= ?x3718 (_ bv0 1))))
(let (($x917 (= (not (and (distinct (_ bv0 1) ?x3718) true)) $x2584)))
(not $x917)))))
(check-sat)
