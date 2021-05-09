module Funky

greet() = print("Hello World!")


# TODO: Can't tell the difference between variable assignment
# and assignment form of a function
function is_function(e::Expr)
  e.head in (:->,:(=),:function)
end


function is_arg(e::Expr)

end

function is_arg(e::Expr)

end


end # module
