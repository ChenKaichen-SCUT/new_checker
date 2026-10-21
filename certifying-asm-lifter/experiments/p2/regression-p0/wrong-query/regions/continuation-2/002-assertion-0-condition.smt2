; benchmark generated from python API
(set-info :status unknown)
(declare-fun llvm-live-result () (_ BitVec 32))
(assert
 (let (($x62 (and (distinct (_ bv2 32) llvm-live-result) true)))
(let (($x57 (and (distinct ((_ zero_extend 31) (ite $x62 (_ bv1 1) (_ bv0 1))) (_ bv0 32)) true)))
(and (distinct $x57 $x62) true))))
(check-sat)
