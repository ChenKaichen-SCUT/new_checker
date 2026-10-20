; benchmark generated from python API
(set-info :status unknown)
(declare-fun llvm-live-result () (_ BitVec 32))
(assert
 (let (($x26 (and (distinct (_ bv2 32) llvm-live-result) true)))
(let (($x27 (and (distinct ((_ zero_extend 31) (ite $x26 (_ bv1 1) (_ bv0 1))) (_ bv0 32)) true)))
(and (distinct $x27 $x26) true))))
(check-sat)
