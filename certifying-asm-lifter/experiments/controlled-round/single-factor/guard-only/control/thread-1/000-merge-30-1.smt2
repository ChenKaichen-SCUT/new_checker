; benchmark generated from python API
(set-info :status unknown)
(declare-fun |entry:LlvmCmpXchg.oldValue#1| () (_ BitVec 32))
(declare-fun u0 () (_ BitVec 32))
(assert
 (let (($x22 (not (= (_ bv0 32) (ite (or true) u0 |entry:LlvmCmpXchg.oldValue#1|)))))
(let (($x63 (or true)))
(let (($x14 (or $x63)))
(let (($x34 (and $x14 $x22)))
(let (($x67 (and $x14 (not $x22))))
(let (($x50 (or $x67)))
(let (($x17 (not (and $x50 $x34))))
(not $x17)))))))))
(check-sat)
