; benchmark generated from python API
(set-info :status unknown)
(declare-fun llvm-live-result () (_ BitVec 32))
(assert
 (let (($x64 (and (distinct (_ bv2 32) llvm-live-result) true)))
(let (($x18 (not $x64)))
(let (($x61 (and (distinct ((_ zero_extend 31) (ite $x64 (_ bv1 1) (_ bv0 1))) (_ bv0 32)) true)))
(and (distinct $x61 $x18) true)))))
(check-sat)
