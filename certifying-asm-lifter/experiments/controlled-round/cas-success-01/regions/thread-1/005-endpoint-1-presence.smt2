; benchmark generated from python API
(set-info :status unknown)
(declare-fun |entry:LlvmCmpXchg.oldValue#1| () (_ BitVec 32))
(declare-fun u0 () (_ BitVec 32))
(assert
 (let (($x33 (not (= (_ bv0 32) (ite (or true) u0 |entry:LlvmCmpXchg.oldValue#1|)))))
(let (($x17 (or true)))
(let (($x28 (or $x17)))
(let (($x13 (and $x28 (not $x33))))
(let (($x23 (or $x13)))
(let (($x14 (= u0 (_ bv0 32))))
(let (($x56 (= $x14 $x23)))
(not $x56)))))))))
(check-sat)
