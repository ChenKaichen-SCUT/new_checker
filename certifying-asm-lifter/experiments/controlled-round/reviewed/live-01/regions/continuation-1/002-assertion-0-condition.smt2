; benchmark generated from python API
(set-info :status unknown)
(declare-fun llvm-live-result () (_ BitVec 32))
(assert
 (let (($x38 (and (distinct (_ bv2 32) llvm-live-result) true)))
(let (($x36 (and (distinct ((_ zero_extend 31) (ite $x38 (_ bv1 1) (_ bv0 1))) (_ bv0 32)) true)))
(and (distinct $x36 $x38) true))))
(check-sat)
