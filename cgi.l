#!/usr/lib/cgi-bin/pil21/pil

(symbols 'r 'pico)

#all environment vars for CGI in which we're interested.
( for v  '(SERVER_PROTOCOL SERVER_PORT REQUEST_METHOD PATH_INFO PATH_TRANSLATED SCRIPT_NAME QUERY_STRING REMOTE_HOST REMOTE_ADDR AUTH_TYPE REMOTE_USER REMOTE_IDENT CONTENT_TYPE CONTENT_LENGTH HOME)
  (set (intern (lowc v) 'r) (sys v)) #intern into this namespace
)

#shorthands
(setq req_meth request_method)
(setq un remote_user)

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
    (split (chop Qs) '& )
  )
)

(setq qs (parse_qs query_string))

(when (member req_meth '(POST PUT)) 
  (setq post (parse_qs (in () (read))))
)
