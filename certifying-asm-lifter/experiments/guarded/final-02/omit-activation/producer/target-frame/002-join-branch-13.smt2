; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-11 () (_ BitVec 2))
(assert
 (let ((?x8687 ((_ extract 1 1) p0-join-read-11)))
(let (($x204 (= ?x8687 (_ bv0 1))))
(let (($x3066 (= (not (and (distinct (_ bv0 1) ?x8687) true)) $x204)))
(not $x3066)))))
(check-sat)
