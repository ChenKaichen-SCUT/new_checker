; benchmark generated from python API
(set-info :status unknown)
(declare-fun |pd-source-0:p1-open-read-2| () (_ BitVec 32))
(assert
 (let (($x15 (and (distinct ((_ zero_extend 31) (ite (and (distinct (_ bv0 32) |pd-source-0:p1-open-read-2|) true) (_ bv1 1) (_ bv0 1))) (_ bv0 32)) true)))
(let (($x28 (= (_ bv2 32) |pd-source-0:p1-open-read-2|)))
(let (($x177 (and (distinct (_ bv0 32) (ite $x28 |pd-source-0:p1-open-read-2| |pd-source-0:p1-open-read-2|)) true)))
(let (($x180 (= $x177 $x15)))
(not $x180))))))
(check-sat)
