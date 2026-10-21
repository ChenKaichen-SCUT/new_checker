; benchmark generated from python API
(set-info :status unknown)
(declare-fun |pd-source-1:p1-open-read-2| () (_ BitVec 32))
(assert
 (let (($x2534 (and (distinct ((_ zero_extend 31) (ite (and (distinct (_ bv0 32) |pd-source-1:p1-open-read-2|) true) (_ bv1 1) (_ bv0 1))) (_ bv0 32)) true)))
(let (($x2583 (= (_ bv2 32) |pd-source-1:p1-open-read-2|)))
(let (($x1153 (and (distinct (_ bv0 32) (ite $x2583 |pd-source-1:p1-open-read-2| |pd-source-1:p1-open-read-2|)) true)))
(let (($x727 (= $x1153 $x2534)))
(not $x727))))))
(check-sat)
