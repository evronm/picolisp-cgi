#!/usr/lib/cgi-bin/pil21/pil

(load "lib/util.l")
(symbols 'r 'util 'pico)


#shorthands
(de req_meth () (sys 'REQUEST_METHOD) )
(de pth () (cdr (sc (sys 'SCRIPT_NAME) "/")))

(de url_dec (S) 
  (let (s (split (replace S "+" " ") '%))
    (pack 
      (cons 
        (car s)
        (mapcar '((s)
          (cons (char (hex (pack (head 2 s)))) (nth s 3))
        ) (cdr s))
      )
    )
  )
)

(de parse_qs (Qs)
  (mapcar 
    '((Kv)
      (let kv (split Kv '=)
        (list (pack (car kv)) ( url_dec (cadr kv)))
      )
     )
    (sc Qs '&)
  )
)

(setq qs (parse_qs (sys 'QUERY_STRING)))

(when (member req_meth '(POST PUT)) 
  (setq post (parse_qs (in () (read))))
)

(when *Dbg
  ~(assert (= '(("a" "x u") ("b" "123!")) (r~parse_qs "a=x%20u&b=123%21")))
  (sys 'SCRIPT_NAME "/foo/1/bar/2")
  ~(assert (= (pth) '(("f" "o" "o") ("1") ("b" "a" "r") ("2")) ) )
)
