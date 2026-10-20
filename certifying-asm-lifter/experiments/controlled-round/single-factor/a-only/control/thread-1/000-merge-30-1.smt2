; benchmark generated from python API
(set-info :status unknown)
(declare-fun |entry:LlvmCmpXchg.oldValue#1| () (_ BitVec 32))
(declare-fun u0 () (_ BitVec 32))
(assert
 (let (($x25 (not (= (_ bv0 32) (ite (or true) u0 |entry:LlvmCmpXchg.oldValue#1|)))))
(let (($x17 (or true)))
(let (($x18 (or $x17)))
(let (($x26 (and $x18 $x25)))
(let (($x28 (and $x18 (not $x25))))
(let (($x29 (or $x28)))
(let (($x34 (not (and $x29 $x26))))
(not $x34)))))))))
(check-sat)
