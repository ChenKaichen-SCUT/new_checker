; benchmark generated from python API
(set-info :status unknown)
(declare-fun inline-source-output () (_ BitVec 32))
(assert
 (let (($x15 (and (distinct ((_ zero_extend 31) (ite (and (distinct (_ bv2 32) inline-source-output) true) (_ bv1 1) (_ bv0 1))) (_ bv0 32)) true)))
(let (($x5 (= (_ bv2 32) inline-source-output)))
(and (distinct $x5 $x15) true))))
(check-sat)
