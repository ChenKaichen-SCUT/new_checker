; benchmark generated from python API
(set-info :status unknown)
(assert
 (let (($x21 (and true true true true true true true true true true (not (= (_ bv42 32) (_ bv42 32))) true true true true true true true true true)))
(and (and (and true (not (= (_ bv0 32) (_ bv4294967295 32)))) true) $x21)))
(check-sat)
