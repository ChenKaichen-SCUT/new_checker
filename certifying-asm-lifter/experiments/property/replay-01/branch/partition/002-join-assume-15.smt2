; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-11 () (_ BitVec 2))
(assert
 (let ((?x444 ((_ extract 0 0) p0-join-read-11)))
(let (($x538 (= ?x444 (_ bv0 1))))
(let (($x456 (= (not (and (distinct (_ bv0 1) ?x444) true)) $x538)))
(not $x456)))))
(check-sat)
