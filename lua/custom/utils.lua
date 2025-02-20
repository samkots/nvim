
M = {}


function M.get_nvim_version()
  v = vim.version()
  return { v.major, v.minor, v.patch }
end


function M.compare_nvim_versions(v1, v2)
  for i = 1, math.min(#v1, #v2) do
    if v1[i] < v2[i] then return -1 end
    if v1[i] > v2[i] then return 1 end
  end

  if #v1 < #v2 then return -1 end
  if #v1 > #v2 then return 1 end

  return 0
end


return M

