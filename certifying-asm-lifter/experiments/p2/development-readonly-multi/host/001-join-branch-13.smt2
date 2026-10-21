; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-11 () (_ BitVec 2))
(assert
 (let ((?x452 ((_ extract 1 1) p0-join-read-11)))
(let (($x1176 (= ?x452 (_ bv0 1))))
(let (($x1191 (= (not (and (distinct (_ bv0 1) ?x452) true)) $x1176)))
(not $x1191)))))
(check-sat)
