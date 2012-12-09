local GOL = {}

local clock = os.clock
local sleep = function(n)
  local t0 = clock()
  while clock() - t0 <= n do end
end


GOL.live_cell = { alive = true }
GOL.dead_cell = { alive = false }
GOL.random_cell = function()
  if math.random() > 0.5 then
    return GOL.live_cell
  else
    return GOL.dead_cell
  end
end

GOL.dead_cell.next_state = function(alive_neighbours)
  if alive_neighbours == 3 then
    return GOL.live_cell
  else
    return GOL.dead_cell
  end
end
GOL.live_cell.next_state = function(alive_neighbours)
  if alive_neighbours >=2 and alive_neighbours <= 3 then
    return GOL.live_cell
  else
    return GOL.dead_cell
  end
end

GOL.Grid = {}
GOL.Grid.from_string = function(str)
  grid = { {} }

  string.gsub(str, '(.)', function(s)
    if s == "\n" then
      table.insert(grid, {})
    elseif s == 'x' then
      table.insert(grid[#grid], GOL.live_cell)
    elseif s == '_' then
      table.insert(grid[#grid], GOL.dead_cell)
    end
  end)
  return grid
end

GOL.Grid.to_string = function(grid, live_string, dead_string)
  str_grid = ''
  live_string = live_string or 'x'
  dead_string = dead_string or '_'
  
  for i,row in ipairs(grid) do
    for j,cell in ipairs(row) do
      if cell == GOL.live_cell then
        str_grid = str_grid .. live_string
      elseif cell == GOL.dead_cell then
        str_grid = str_grid .. dead_string
      end
    end
    if i < #grid then
      str_grid = str_grid .. "\n"
    end
  end
  return str_grid
end

GOL.Grid.count_live_neighbours = function(grid, x, y)
  neighbour_positions = {
    {-1,-1}, {0,-1}, {1,-1},
    {-1,0},          {1,0},
    {-1,1},  {0,1},  {1,1}
  }
  live_neighbour_count = 0
  for i,pos in ipairs(neighbour_positions) do
    x_i, y_i = x+pos[1], y+pos[2]
    
    if x_i>=1 and y_i>=1 and x_i <= #grid[1] and y_i <= #grid then
      if grid[y+pos[2]][x+pos[1]] == GOL.live_cell then
        live_neighbour_count = live_neighbour_count + 1
      end
    end
  end
  return live_neighbour_count
end

GOL.Grid.evolve = function(grid)
  new_grid = {}
  for row_i, row in ipairs(grid) do
    table.insert(new_grid, {})
    for cell_i, cell in ipairs(row) do
      new_cell = cell.next_state( GOL.Grid.count_live_neighbours(grid, cell_i, row_i) )
      table.insert(new_grid[row_i], new_cell)
    end
  end
  return new_grid
end

GOL.Grid.random_grid = function(x, y)
  grid = {}
  for y_i = 1,y,1 do
    table.insert(grid, {})
    for x_i = 1,x,1 do
      table.insert(grid[#grid], GOL.random_cell())
    end
  end
  return grid
end

GOL.Grid.play = function(x,y)
  grid = GOL.Grid.random_grid(x,y)
  while true do
    os.execute('clear')
    print(GOL.Grid.to_string(grid, '()', '  '))
    grid = GOL.Grid.evolve(grid)
    sleep(0.1)
  end
end

return GOL
