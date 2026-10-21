; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-11 () (_ BitVec 2))
(assert
 (let ((?x101 ((_ extract 1 1) p0-join-read-11)))
(let (($x1183 (= ?x101 (_ bv0 1))))
(let (($x281 (= (not (and (distinct (_ bv0 1) ?x101) true)) $x1183)))
(not $x281)))))
(check-sat)
