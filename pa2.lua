-- McKade Sorensen
-- Last revision date: 02/10/2019
-- Source for module pa2

local pa2 = {} -- Table that contains module members


-- Returns a table of all truthy values in t
function pa2.filterTable(p, t)
  local truthy_keypairs = {} -- Table that stores truthy values

  for key, value in pairs(t) do
    if p(value) then
      truthy_keypairs[key] = value
    end
  end

  return truthy_keypairs
end


-- Returns a string with str repeated int many of times
function pa2.concatMax(str, num)
  return string.rep(str, math.floor(num/(#str)))
end


-- Given k, collatz yields all the Collatz sequences starting at k
function pa2.collatz(k)
  coroutine.yield(k)

  while k ~= 1 do
    if k % 2 ~= 0 then
      k = 3*k+1
    else
      k = k/2
    end
    coroutine.yield(k)
  end
end

local function _sum(n, x)
  if n == 0 then
    return x
  end
  return _sum(n-1, x+n)
end

-- Write what it does
function pa2.allSubs(s)
  s = string.reverse(s)
  local clmb, row = #s+2, 0
  if clmb == 2 then clmb = "on" end -- If the string is empty

  local function iter(dummy1)
      if clmb == "on" then -- If the string is empty
        row, s, clmb = 4, "exit", "off"
        return string.sub(s, 0, 0)
      end

      if clmb == 1 then
        clmb = #s - row
        row = row + 1
      end

      if row == #s then
        return nil
      elseif #s == 0 then
        row = #s
      end

      clmb = clmb - 1
      return string.reverse(string.sub(s, clmb, clmb+row))
    end
  return iter, nil, nil
end

return pa2
