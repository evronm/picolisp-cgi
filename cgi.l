#!/usr/lib/cgi-bin/pil21/bin/picolisp

(symbols 'req 'pico)

#all environment vars for CGI in which we're interested.
( for v  '(SERVER_PROTOCOL SERVER_PORT REQUEST_METHOD PATH_INFO PATH_TRANSLATED SCRIPT_NAME QUERY_STRING REMOTE_HOST REMOTE_ADDR AUTH_TYPE REMOTE_USER REMOTE_IDENT CONTENT_TYPE CONTENT_LENGTH HOME)
  (set (intern (lowc v)) (sys v))
)

#shorthands
(setq req_meth request_method)
(setq q query_string)
(setq un remote_user)

(de url_dec (S) 
(!)
  (pack 
    (mapcar '((s)
      (cons (char (hex (pack (head 2 s)))) (nth s 3))
    ) (cdr (split (replace S "+" " ") '%)))
  )
)

(de process_qs (Qs)
  (for qs (split (chop Qs) '& )
    (let kv (split qs '=)
      (set (intern (car kv)) (url_dec (cadr kv)))
    )
  )

)

(when (member req_meth '(POST PUT)) 
  (process_qs (in () (read)))
)
