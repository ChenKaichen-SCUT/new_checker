; benchmark generated from python API
(set-info :status unknown)
(declare-fun llvm-live-result () (_ BitVec 32))
(assert
 (let (($x57 (and (distinct (_ bv2 32) llvm-live-result) true)))
(let (($x6 (and (distinct ((_ zero_extend 31) (ite $x57 (_ bv1 1) (_ bv0 1))) (_ bv0 32)) true)))
(and (distinct $x6 $x57) true))))
(check-sat)
