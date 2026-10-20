; benchmark generated from python API
(set-info :status unknown)
(declare-fun llvm-live-result () (_ BitVec 32))
(assert
 (let (($x65 (= (_ bv1 32) llvm-live-result)))
(let (($x70 (and (distinct ((_ zero_extend 31) (ite $x65 (_ bv1 1) (_ bv0 1))) (_ bv0 32)) true)))
(and (distinct $x70 $x65) true))))
(check-sat)
