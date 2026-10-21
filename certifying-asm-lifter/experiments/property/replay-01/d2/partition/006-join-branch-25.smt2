; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-23 () (_ BitVec 2))
(assert
 (let ((?x738 ((_ extract 1 1) p0-join-read-23)))
(let (($x352 (= ?x738 (_ bv0 1))))
(let (($x395 (= (not (and (distinct (_ bv0 1) ?x738) true)) $x352)))
(not $x395)))))
(check-sat)
