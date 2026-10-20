; benchmark generated from python API
(set-info :status unknown)
(declare-fun |entry:LlvmCmpXchg.oldValue#1| () (_ BitVec 32))
(declare-fun u0 () (_ BitVec 32))
(assert
 (let (($x67 (not (= (_ bv0 32) (ite (or true) u0 |entry:LlvmCmpXchg.oldValue#1|)))))
(let (($x10 (or true)))
(let (($x71 (or $x10)))
(let (($x24 (and $x71 (not $x67))))
(let (($x25 (or $x24)))
(let (($x34 (= u0 (_ bv0 32))))
(let (($x38 (= $x34 $x25)))
(not $x38)))))))))
(check-sat)
