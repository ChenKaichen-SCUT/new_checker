; benchmark generated from python API
(set-info :status unknown)
(declare-fun |entry:LlvmCmpXchg.oldValue#1| () (_ BitVec 32))
(declare-fun u0 () (_ BitVec 32))
(assert
 (let (($x25 (not (= (_ bv0 32) (ite (or true) u0 |entry:LlvmCmpXchg.oldValue#1|)))))
(let (($x17 (or true)))
(let (($x18 (or $x17)))
(let (($x28 (and $x18 (not $x25))))
(let (($x29 (or $x28)))
(let (($x16 (= u0 (_ bv0 32))))
(let (($x56 (= $x16 $x29)))
(not $x56)))))))))
(check-sat)
