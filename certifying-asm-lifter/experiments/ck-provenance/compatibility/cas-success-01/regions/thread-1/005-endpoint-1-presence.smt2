; benchmark generated from python API
(set-info :status unknown)
(declare-fun |entry:LlvmCmpXchg.oldValue#1| () (_ BitVec 32))
(declare-fun u0 () (_ BitVec 32))
(assert
 (let (($x39 (not (= (_ bv0 32) (ite (or true) u0 |entry:LlvmCmpXchg.oldValue#1|)))))
(let (($x57 (or true)))
(let (($x19 (or $x57)))
(let (($x73 (and $x19 (not $x39))))
(let (($x61 (or $x73)))
(let (($x11 (= u0 (_ bv0 32))))
(let (($x30 (= $x11 $x61)))
(not $x30)))))))))
(check-sat)
