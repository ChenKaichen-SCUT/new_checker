; benchmark generated from python API
(set-info :status unknown)
(declare-fun |pd-source-1:p1-open-read-0| () (_ BitVec 32))
(assert
 (let (($x577 (and (distinct ((_ zero_extend 31) (ite (and (distinct (_ bv0 32) |pd-source-1:p1-open-read-0|) true) (_ bv1 1) (_ bv0 1))) (_ bv0 32)) true)))
(let (($x1546 (and (distinct (_ bv0 32) |pd-source-1:p1-open-read-0|) true)))
(let (($x384 (= $x1546 $x577)))
(not $x384)))))
(check-sat)
