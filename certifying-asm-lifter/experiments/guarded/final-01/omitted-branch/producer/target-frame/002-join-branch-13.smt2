; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-11 () (_ BitVec 2))
(assert
 (let ((?x1076 ((_ extract 1 1) p0-join-read-11)))
(let (($x6210 (= ?x1076 (_ bv0 1))))
(let (($x86 (= (not (and (distinct (_ bv0 1) ?x1076) true)) $x6210)))
(not $x86)))))
(check-sat)
