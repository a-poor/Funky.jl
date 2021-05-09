module Funky

"""
  is_arrow_function(e::Expr)

Checks if the expression `e` is an arrow function of the form:

```julia-repl
julia> (a::Int, b::String) -> fill(b,a)
#1 (generic function with 1 method)
```

See also: [is_function](@ref), [is_fun_function](@ref), [is_assign_function](@ref)
"""
function is_arrow_function(e::Expr)
  e.head == :->
end

"""
  is_fun_function(e::Expr)

Checks if the expression `e` is a function of the form:

```julia-repl
julia> function foo(x::Int) x^2 end
foo (generic function with 1 method)
```

or an anonamous function of the form:

```julia-repl
julia> function (x::Int) x^2 end
#1 (generic function with 1 method)
```

See also: [is_function](@ref), [is_arrow_function](@ref), [is_assign_function](@ref)
"""
function is_fun_function(e::Expr)
  e.head == :function
end


"""
  is_assign_function(e::Expr)

Checks if the expression `e` is an arrow function of the form:

```julia-repl
julia> foo(x::Int) = x^2
foo (generic function with 1 method)
```

See also: [is_function](@ref), [is_arrow_function](@ref), [is_fun_function](@ref)
"""
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

See also: [is_arrow_function](@ref), [is_fun_function](@ref), [is_assign_function](@ref)
"""
function is_function(e::Expr)
  is_arrow_function(e) ||
  is_fun_function(e) ||
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


"""
  get_args(e::Expr)


See also: [get_all_args](@ref), [get_kwargs](@ref)
"""
function get_args(e::Expr)

end

"""
  get_kwargs(e::Expr)


See also: [get_all_args](@ref), [get_args](@ref)
"""
function get_kwargs(e::Expr)

end


"""
  get_all_args(e::Expr)


See also: [get_args](@ref), [get_kwargs](@ref)
"""
function get_all_args(e::Expr)
  (
    args=get_args(e), 
    kwargs=get_kwargs(e)
  )
end

end # module
