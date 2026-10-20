; benchmark generated from python API
(set-info :status unknown)
(declare-fun different-live-result () (_ BitVec 32))
(declare-fun llvm-live-result () (_ BitVec 32))
(assert
 (let (($x23 (and (distinct ((_ zero_extend 31) (ite (= (_ bv1 32) different-live-result) (_ bv1 1) (_ bv0 1))) (_ bv0 32)) true)))
(let (($x32 (and (distinct ((_ zero_extend 31) (ite (= (_ bv1 32) llvm-live-result) (_ bv1 1) (_ bv0 1))) (_ bv0 32)) true)))
(or (and (distinct $x32 $x23) true)))))
(check-sat)
