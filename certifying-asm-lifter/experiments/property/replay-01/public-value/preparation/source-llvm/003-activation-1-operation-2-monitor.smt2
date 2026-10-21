; benchmark generated from python API
(set-info :status unknown)
(declare-fun |pd-source-1:p1-open-read-0| () (_ BitVec 32))
(assert
 (let (($x2557 (and (distinct ((_ zero_extend 31) (ite (and (distinct (_ bv0 32) |pd-source-1:p1-open-read-0|) true) (_ bv1 1) (_ bv0 1))) (_ bv0 32)) true)))
(let (($x561 (and (distinct (_ bv0 32) |pd-source-1:p1-open-read-0|) true)))
(let (($x400 (= $x561 $x2557)))
(not $x400)))))
(check-sat)
