; benchmark generated from python API
(set-info :status unknown)
(declare-fun llvm-live-result () (_ BitVec 32))
(assert
 (let (($x48 (and (distinct (_ bv2 32) llvm-live-result) true)))
(let (($x31 (not $x48)))
(let (($x57 (and (distinct ((_ zero_extend 31) (ite $x48 (_ bv1 1) (_ bv0 1))) (_ bv0 32)) true)))
(and (distinct $x57 $x31) true)))))
(check-sat)
