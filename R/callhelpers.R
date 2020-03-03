

##########################
# CALL HELPER FUNCTIONS
# -----------------------
# 
# Helper methods for function calling at run-time
# 
# ########################
# Nunes et al, 2020
# Last updated version: 0.1.0

# Finds recursively the source name of 'obj' function used as argument in parent functions
call.objname <- function(obj, prevfns=0)
{
  prevfns = prevfns + 1
  nm = deparse(substitute(obj))
  if (prevfns > 1)
  {
    for (i in (2:prevfns))
    {
      ptxt = sprintf('deparse(substitute(%s))', nm)
      nm = eval.parent(parse(text=ptxt), n=i-1)
    }
  }
  nm
}

# Gets a list of the default arguments inside the currect function
call.default.arg <- function(obj, prevfns=0L)
{
  prevfns = prevfns + 1L
  objname = call.objname(obj, prevfns)
  fms = eval.parent(formals(sys.function(sys.parent(prevfns))), prevfns)
  if (!(objname %in% names(fms))) return(NULL)
  argres = fms[[objname]]
  if (missing(argres)) argres = NULL
  if (is.call(argres)) argres = eval.parent(argres, prevfns)
  return(argres)
}

# Gets a character vector with the argument names used in dots. This does not evaluate the arguments
call.dots.argnames <- function(...) names(match.call(expand.dots = FALSE)$`...`)

# Gets a pairlist with the unvaluated arguments included in dots
call.dots.args <- function(...) match.call(expand.dots = FALSE)$`...`