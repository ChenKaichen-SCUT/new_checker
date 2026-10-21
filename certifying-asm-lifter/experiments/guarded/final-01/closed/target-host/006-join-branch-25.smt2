; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-23 () (_ BitVec 2))
(assert
 (let ((?x6952 ((_ extract 1 1) p0-join-read-23)))
(let (($x3645 (= ?x6952 (_ bv0 1))))
(let (($x5532 (= (not (and (distinct (_ bv0 1) ?x6952) true)) $x3645)))
(not $x5532)))))
(check-sat)
