; benchmark generated from python API
(set-info :status unknown)
(declare-fun |pd-source-1:p1-open-read-0| () (_ BitVec 32))
(assert
 (let (($x401 (and (distinct ((_ zero_extend 31) (ite (and (distinct (_ bv0 32) |pd-source-1:p1-open-read-0|) true) (_ bv1 1) (_ bv0 1))) (_ bv0 32)) true)))
(let (($x488 (and (distinct (_ bv0 32) |pd-source-1:p1-open-read-0|) true)))
(let (($x723 (= $x488 $x401)))
(not $x723)))))
(check-sat)
