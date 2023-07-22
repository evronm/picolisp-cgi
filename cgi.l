#!/usr/lib/cgi-bin/pil21/bin/picolisp


(class +Req)
`(for m '( (comspec . COMSPEC) (document_root . DOCUMENT_ROOT) (gateway_interface . GATEWAY_INTERFACE) (home . HOME) (http_accept . HTTP_ACCEPT) (http_accept_charset . HTTP_ACCEPT_CHARSET) (http_accept_encoding . HTTP_ACCEPT_ENCODING) (http_accept_language . HTTP_ACCEPT_LANGUAGE) (http_connection . HTTP_CONNECTION) (http_host . HTTP_HOST) (http_user_agent . HTTP_USER_AGENT) (path . PATH) (pathext . PATHEXT) (path_info . PATH_INFO) (path_translated . PATH_TRANSLATED) (query_string . QUERY_STRING) (remote_addr . REMOTE_ADDR) (remote_port . REMOTE_PORT) (request_method . REQUEST_METHOD) (request_uri . REQUEST_URI) (script_filename . SCRIPT_FILENAME) (script_name . SCRIPT_NAME) (server_addr . SERVER_ADDR) (server_admin . SERVER_ADMIN) (server_name . SERVER_NAME) (server_port . SERVER_PORT) (server_protocol . SERVER_PROTOCOL) (server_signature . SERVER_SIGNATURE) (server_software . SERVER_SOFTWARE) (systemroot . SYSTEMROOT) (term . TERM) (windir . WINDIR))
  (let ( @k (intern (pack (car m) '>)) @v (cdr m))
    (eval 
      (fill 
        '(dm @k
          (sys '@v)
        )
      )
    )
  ) 
)




