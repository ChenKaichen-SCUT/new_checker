; benchmark generated from python API
(set-info :status unknown)
(declare-fun |activation-1:llvm-create-0-read-0| () (_ BitVec 32))
(declare-fun |activation-1:llvm-create-0-read-1| () (_ BitVec 32))
(assert
 (let ((?x73 (bvadd |activation-1:llvm-create-0-read-1| |activation-1:llvm-create-0-read-0|)))
(let (($x80 (= ?x73 ?x73)))
(not $x80))))
(check-sat)
