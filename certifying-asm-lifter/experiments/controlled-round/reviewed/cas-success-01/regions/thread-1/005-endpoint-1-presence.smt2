; benchmark generated from python API
(set-info :status unknown)
(declare-fun |entry:LlvmCmpXchg.oldValue#1| () (_ BitVec 32))
(declare-fun u0 () (_ BitVec 32))
(assert
 (let (($x37 (not (= (_ bv0 32) (ite (or true) u0 |entry:LlvmCmpXchg.oldValue#1|)))))
(let (($x32 (or true)))
(let (($x45 (or $x32)))
(let (($x15 (and $x45 (not $x37))))
(let (($x34 (or $x15)))
(let (($x75 (= u0 (_ bv0 32))))
(let (($x66 (= $x75 $x34)))
(not $x66)))))))))
(check-sat)
