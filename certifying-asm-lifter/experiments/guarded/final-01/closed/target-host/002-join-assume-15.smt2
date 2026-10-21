; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-11 () (_ BitVec 2))
(assert
 (let ((?x4790 ((_ extract 0 0) p0-join-read-11)))
(let (($x2640 (= ?x4790 (_ bv0 1))))
(let (($x5212 (= (not (and (distinct (_ bv0 1) ?x4790) true)) $x2640)))
(not $x5212)))))
(check-sat)
