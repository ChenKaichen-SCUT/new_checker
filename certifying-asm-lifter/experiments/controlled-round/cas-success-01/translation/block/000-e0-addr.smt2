; benchmark generated from python API
(set-info :status unknown)
(declare-fun |addr:addr1| () (_ BitVec 64))
(assert
 (let (($x10 (= |addr:addr1| |addr:addr1|)))
(not $x10)))
(check-sat)
