; benchmark generated from python API
(set-info :status unknown)
(declare-fun llvm-live-result () (_ BitVec 32))
(assert
 (let (($x61 (= (_ bv1 32) llvm-live-result)))
(let (($x5 (and (distinct ((_ zero_extend 31) (ite $x61 (_ bv1 1) (_ bv0 1))) (_ bv0 32)) true)))
(and (distinct $x5 $x61) true))))
(check-sat)
