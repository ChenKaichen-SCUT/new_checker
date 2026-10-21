; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-23 () (_ BitVec 2))
(assert
 (let ((?x2857 ((_ extract 0 0) p0-join-read-23)))
(let (($x7908 (= ?x2857 (_ bv0 1))))
(let (($x751 (= (not (and (distinct (_ bv0 1) ?x2857) true)) $x7908)))
(not $x751)))))
(check-sat)
