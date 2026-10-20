; benchmark generated from python API
(set-info :status unknown)
(declare-fun llvm-live-result () (_ BitVec 32))
(assert
 (let (($x47 (= (_ bv0 32) llvm-live-result)))
(let (($x40 (and (distinct ((_ zero_extend 31) (ite $x47 (_ bv1 1) (_ bv0 1))) (_ bv0 32)) true)))
(and (distinct $x40 $x47) true))))
(check-sat)
