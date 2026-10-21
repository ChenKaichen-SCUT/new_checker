; benchmark generated from python API
(set-info :status unknown)
(declare-fun |activation-1:llvm-create-0-read-1| () (_ BitVec 32))
(declare-fun |activation-1:llvm-create-0-read-3| () (_ BitVec 32))
(assert
 (let ((?x98 (bvadd |activation-1:llvm-create-0-read-3| |activation-1:llvm-create-0-read-1|)))
(let (($x76 (= ?x98 ?x98)))
(not $x76))))
(check-sat)
