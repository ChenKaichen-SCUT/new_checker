; benchmark generated from python API
(set-info :status unknown)
(declare-fun |pd-source-1:p1-open-read-2| () (_ BitVec 32))
(assert
 (let (($x147 (and (distinct ((_ zero_extend 31) (ite (and (distinct (_ bv0 32) |pd-source-1:p1-open-read-2|) true) (_ bv1 1) (_ bv0 1))) (_ bv0 32)) true)))
(let (($x153 (= (_ bv2 32) |pd-source-1:p1-open-read-2|)))
(let (($x339 (and (distinct (_ bv0 32) (ite $x153 |pd-source-1:p1-open-read-2| |pd-source-1:p1-open-read-2|)) true)))
(let (($x356 (= $x339 $x147)))
(not $x356))))))
(check-sat)
