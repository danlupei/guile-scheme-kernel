# guile-scheme-kernel
GNU Guile Scheme kernel for Jupyter

Progress so far: the approach of writing the kernel directly in Guile proved to be futile effort - there is too much discrepancy
between standard Scheme approach of dealing with things and Guile's own peculiarities.

The next stage is going to use Guile how it should be used, not as a standalone language but embedded in a C++ codebase.
