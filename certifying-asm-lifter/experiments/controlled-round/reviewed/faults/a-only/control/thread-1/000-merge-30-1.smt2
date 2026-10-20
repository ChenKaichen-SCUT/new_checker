; benchmark generated from python API
(set-info :status unknown)
(declare-fun |entry:LlvmCmpXchg.oldValue#1| () (_ BitVec 32))
(declare-fun u0 () (_ BitVec 32))
(assert
 (let (($x47 (not (= (_ bv0 32) (ite (or true) u0 |entry:LlvmCmpXchg.oldValue#1|)))))
(let (($x61 (or true)))
(let (($x48 (or $x61)))
(let (($x22 (and $x48 $x47)))
(let (($x16 (and $x48 (not $x47))))
(let (($x40 (or $x16)))
(let (($x7 (not (and $x40 $x22))))
(not $x7)))))))))
(check-sat)
