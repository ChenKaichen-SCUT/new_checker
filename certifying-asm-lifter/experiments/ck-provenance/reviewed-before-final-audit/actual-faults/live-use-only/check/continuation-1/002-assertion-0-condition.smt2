; benchmark generated from python API
(set-info :status unknown)
(declare-fun llvm-live-result () (_ BitVec 32))
(assert
 (let (($x15 (and (distinct (_ bv2 32) llvm-live-result) true)))
(let (($x44 (not $x15)))
(let (($x65 (and (distinct ((_ zero_extend 31) (ite $x15 (_ bv1 1) (_ bv0 1))) (_ bv0 32)) true)))
(and (distinct $x65 $x44) true)))))
(check-sat)
