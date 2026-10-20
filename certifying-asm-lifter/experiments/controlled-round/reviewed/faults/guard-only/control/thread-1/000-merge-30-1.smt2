; benchmark generated from python API
(set-info :status unknown)
(declare-fun |entry:LlvmCmpXchg.oldValue#1| () (_ BitVec 32))
(declare-fun u0 () (_ BitVec 32))
(assert
 (let (($x28 (not (= (_ bv0 32) (ite (or true) u0 |entry:LlvmCmpXchg.oldValue#1|)))))
(let (($x59 (or true)))
(let (($x24 (or $x59)))
(let (($x7 (and $x24 $x28)))
(let (($x70 (and $x24 (not $x28))))
(let (($x5 (or $x70)))
(let (($x61 (not (and $x5 $x7))))
(not $x61)))))))))
(check-sat)
