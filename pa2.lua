-- McKade Sorensen
-- Last revision date: 02/09/2019
-- Source for module pa2

local pa2 = {} -- Table that contains module members


-- Returns a table of all truthy values in t
function pa2.filterTable(p, t)
  local truthy_keypairs = {} -- Table that stores truthy values

  for key, value in pairs(t) do
    if p(value) == true and p(value) ~= nil then
      truthy_keypairs[key] = value
    end
  end

  return truthy_keypairs
end


-- Returns a string with str repeated int many of times
function pa2.concatMax(str, int)
  return string.rep(str, math.floor(int/(#str)))
end


-- Write what it does
function pa2.collatz()
end


-- Write what it does
function pa2.allSubs()
end


return pa2
