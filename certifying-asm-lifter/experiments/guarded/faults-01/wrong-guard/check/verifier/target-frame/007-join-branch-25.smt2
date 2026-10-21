; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-23 () (_ BitVec 2))
(assert
 (let ((?x98 ((_ extract 1 1) p0-join-read-23)))
(let (($x81 (= ?x98 (_ bv0 1))))
(let (($x76 (= (not (and (distinct (_ bv0 1) ?x98) true)) $x81)))
(not $x76)))))
(check-sat)
