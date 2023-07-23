#!/usr/lib/cgi-bin/pil21/bin/picolisp

(symbols 'req 'pico)

#(mapcar '((v) (! set (lowc v ) ( sys v)))  
( for v  
  '(SERVER_PROTOCOL SERVER_PORT REQUEST_METHOD PATH_INFO PATH_TRANSLATED SCRIPT_NAME QUERY_STRING REMOTE_HOST REMOTE_ADDR AUTH_TYPE REMOTE_USER REMOTE_IDENT CONTENT_TYPE CONTENT_LENGTH HOME)
  (set (intern (lowc v)) (sys v))
)



