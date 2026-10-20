; benchmark generated from python API
(set-info :status unknown)
(declare-fun different-live-result () (_ BitVec 32))
(declare-fun llvm-live-result () (_ BitVec 32))
(assert
 (let (($x21 (and (distinct ((_ zero_extend 31) (ite (and (distinct (_ bv2 32) different-live-result) true) (_ bv1 1) (_ bv0 1))) (_ bv0 32)) true)))
(let (($x28 (and (distinct ((_ zero_extend 31) (ite (and (distinct (_ bv2 32) llvm-live-result) true) (_ bv1 1) (_ bv0 1))) (_ bv0 32)) true)))
(or (and (distinct $x28 $x21) true)))))
(check-sat)
