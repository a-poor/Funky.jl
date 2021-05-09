# Funky.jl

_created by Austin Poor_

A julia package for working with function expressions.

## Quick-Start

```julia
julia> e = :((a::Int, b::Float64 = 2. ; k::Int = 1) -> a + b + k)
:((a::Int, b::Float64 = 2.0; k::Int = 1)->begin
          #= REPL[17]:1 =#
          a + b + k
      end)

julia> # ...
```


## Background

I started this package when working on another Julia package, 
[QuickAPI.jl](https://github.com/a-poor/QuickAPI.jl) and found myself
looking for some of this functionality. Rather than add it as a 
sub-module in `QuickAPI.jl`, I figured it would be better to write it 
as a separate package. 
