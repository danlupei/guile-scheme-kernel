(use-modules (json))

#!(define shared-env (make-top-level-environment))
(load "shared" shared-env)
(define env (the-environment))
(for-each
  (lambda (binding) (apply environment-define env binding))
  (environment-bindings shared-env))
(environment-define shared-env 'shared-env shared-env)
!#
; (use-modules (guile-jupyter kernel))
(load "guile-jupyter/kernel/utils.scm")
(load "guile-jupyter/kernel/info.scm")
(load "guile-jupyter/kernel/error.scm")
(load "guile-jupyter/kernel/stdio.scm")
(load "guile-jupyter/kernel/shutdown.scm")
(load "guile-jupyter/kernel/session.scm")
(load "guile-jupyter/kernel/complete.scm")
(load "guile-jupyter/kernel/execute.scm")
(load "guile-jupyter/kernel/comm/comm.scm")
(load "guile-jupyter/kernel/comm/version.scm")
(load "guile-jupyter/kernel/comm/widget/widget.scm")
(load "guile-jupyter/kernel/comm/widget/backbone.scm")
(load "guile-jupyter/kernel/comm/widget/custom.scm")
(load "guile-jupyter/kernel/kernel.scm")

(define args (command-line))
(assert (> (length args) 0))

(define file (open-input-file (car args)))
(define text (read-string (char-set) file))
(define json (json-string->scm text))

(assert (and (vector? json)
             (= 1 (vector-length json))))

(define (ref key)
  (cdr (assq key (vector-ref json 0))))
(define control-port     (ref 'control_port))
(define shell-port       (ref 'shell_port))
(define transport        (ref 'transport))
(define signature-scheme (ref 'signature_scheme))
(define stdin-port       (ref 'stdin_port))
(define hb-port          (ref 'hb_port))
(define ip               (ref 'ip))
(define iopub-port       (ref 'iopub_port))
(define key              (ref 'key))

(listen transport
        ip
        signature-scheme
        key
        control-port
        shell-port
        stdin-port
        hb-port
        iopub-port)
