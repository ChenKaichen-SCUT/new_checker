; benchmark generated from python API
(set-info :status unknown)
(declare-fun |llvm-entry:@x| () (_ BitVec 64))
(assert
 (let (($x11 (= |llvm-entry:@x| |llvm-entry:@x|)))
(not $x11)))
(check-sat)
