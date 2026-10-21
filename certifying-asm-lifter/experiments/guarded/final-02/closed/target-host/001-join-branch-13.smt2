; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-11 () (_ BitVec 2))
(assert
 (let ((?x79 ((_ extract 1 1) p0-join-read-11)))
(let (($x8773 (= ?x79 (_ bv0 1))))
(let (($x748 (= (not (and (distinct (_ bv0 1) ?x79) true)) $x8773)))
(not $x748)))))
(check-sat)
