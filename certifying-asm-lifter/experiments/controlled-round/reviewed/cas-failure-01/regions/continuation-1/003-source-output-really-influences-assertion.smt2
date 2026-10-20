; benchmark generated from python API
(set-info :status unknown)
(declare-fun different-live-result () (_ BitVec 32))
(declare-fun llvm-live-result () (_ BitVec 32))
(assert
 (let (($x76 (and (distinct ((_ zero_extend 31) (ite (= (_ bv1 32) different-live-result) (_ bv1 1) (_ bv0 1))) (_ bv0 32)) true)))
(let (($x41 (and (distinct ((_ zero_extend 31) (ite (= (_ bv1 32) llvm-live-result) (_ bv1 1) (_ bv0 1))) (_ bv0 32)) true)))
(or (and (distinct $x41 $x76) true)))))
(check-sat)
