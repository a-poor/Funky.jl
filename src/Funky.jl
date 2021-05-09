module Funky

greet() = print("Hello World!")


function is_arrow_function(e::Expr)
  e.head == :->
end

function is_anon_function(e::Expr)
  e.head == :function
end

function is_assign_function(e::Expr)
  e.head == :(=) &&
  length(e.args) > 0 &&
  typeof(e.args[1]) == Expr &&
  e.args[1].head == :call
end

"""
  is_function(e::Expr)

Check if the expression `e` is a function definition. 
  
Note: Doesn't work for functions defined elsewhere and passed
using the function's name (where the input would be `Symbol`
not `Expr`).

# Examples
```julia-repl
julia> is_function(:((a::Int, b::String) -> [b for _ = 1:a]))
true

julia> is_function(:(1 + 2))
true

julia> is_function(:(function (a::Int, b::String)
           [b for _ = 1:a]
       end))
true

julia> is_function(:(a = 1 + 2))
false

julia> is_function(:(a() = 1 + 2))
true
```
"""
function is_function(e::Expr)
  is_arrow_function(e) ||
  is_anon_function(e) ||
  is_assign_function(e)
end


function get_args(e::Expr)
  # Start by checking that `e` is a function
  !is_function(e) && error("`e` is not a function.")


end


"""
"""
function has_args(e::Expr)

end


function is_arg(e::Expr)

end

function is_optional(e::Expr)

end

function is_kwarg(e::Expr)

end


end # module
