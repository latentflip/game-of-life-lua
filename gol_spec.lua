local GOL = require "gol"

describe("Game of Life", function()

  describe("Cells", function()
    it('should have live and dead cells', function()
      assert(GOL.live_cell.alive)
      assert.False(GOL.dead_cell.alive)
    end)
    
    describe("live_cell", function()
      describe('next_state', function()
        it('should be dead if less than 2 neighbours', function()
          assert.equal(GOL.dead_cell, GOL.live_cell.next_state(0))
          assert.equal(GOL.dead_cell, GOL.live_cell.next_state(1))
        end)
        it('should be alive if 2 or 3 neighbours', function()
          assert.equal(GOL.live_cell, GOL.live_cell.next_state(2))
          assert.equal(GOL.live_cell, GOL.live_cell.next_state(3))
        end)
        it('should be dead if more than 3 neighbours', function()
          assert.equal(GOL.dead_cell, GOL.live_cell.next_state(4))
          assert.equal(GOL.dead_cell, GOL.live_cell.next_state(5))
        end)
      end)
    end)

    describe("dead_cell", function()
      describe('next_state', function()
        it('should be live if exactly 3 neighbours', function()
          assert.equal(GOL.live_cell, GOL.dead_cell.next_state(3))
        end)
        it('dead otherwise', function()
          assert.equal(GOL.dead_cell, GOL.dead_cell.next_state(2))
          assert.equal(GOL.dead_cell, GOL.dead_cell.next_state(4))
        end)
      end)
    end)
  end)

  describe("Grid", function()
    describe(".from_string", function()
      local grid

      setup(function()
        grid = GOL.Grid.from_string(
        [[_____
          _xxx_
          _____]])
      end)

      it("should break the string up into rows", function()
        assert.equal(3, #grid)
      end)

      it("should break the rows up into cells", function()
        assert.equal(5, #grid[1])
      end)

      it("should convert x's to alive cells", function()
        assert.same(GOL.live_cell, grid[2][2])
      end)

      it("should convert _'s to dead cells", function()
        assert.same(GOL.dead_cell, grid[1][1])
      end)
    end)

    describe(".to_string", function()
      local str
      
      setup(function()
        local grid = {
          { GOL.live_cell, GOL.dead_cell },
          { GOL.dead_cell, GOL.live_cell }
        }
        str = GOL.Grid.to_string(grid)
      end)

      it("should convert live cells to x and dead cells to _", function()
        assert.equal("x_\n_x", str)
      end)
    end)

    describe(".count_live_neighbours", function()
      local grid

      before_each(function()
        grid = {
          { GOL.dead_cell, GOL.dead_cell, GOL.dead_cell },
          { GOL.dead_cell, GOL.dead_cell, GOL.dead_cell },
          { GOL.dead_cell, GOL.dead_cell, GOL.dead_cell },
        }
      end)

      it('should be 0 if no live neighbors', function()
        count = GOL.Grid.count_live_neighbours(grid, 2, 2)
        assert.equal(0, count)
      end)
      it('should be 1 if one horizontal neighbour', function()
        grid[2][1] = GOL.live_cell
        assert.equal(1, GOL.Grid.count_live_neighbours(grid, 2, 2))
      end)
      it('should be 1 if one horizontal neighbour', function()
        grid[1][2] = GOL.live_cell
        assert.equal(1, GOL.Grid.count_live_neighbours(grid, 2, 2))
      end)
      it('should be 1 if one diagonal neighbour', function()
        grid[1][1] = GOL.live_cell
        assert.equal(1, GOL.Grid.count_live_neighbours(grid, 2, 2))
      end)
      it('should count multiple live neighbours', function()
        grid[1][1] = GOL.live_cell
        grid[2][1] = GOL.live_cell
        grid[3][1] = GOL.live_cell
        assert.equal(3, GOL.Grid.count_live_neighbours(grid, 2, 2))
      end)
      it('shouldnt die on edge cells', function()
        assert.equal(0, GOL.Grid.count_live_neighbours(grid, 1, 1))
      end)
    end)
    describe('.evolve', function()
      it('should evolve the game board', function()
        start_grid = GOL.Grid.from_string(
          [[_____
            _xxx_
            _____]])
        end_grid = GOL.Grid.from_string(
          [[__x__
            __x__
            __x__]])
        
        assert.equal(GOL.Grid.to_string(end_grid), GOL.Grid.to_string(GOL.Grid.evolve(start_grid)))
      end)
    end)
  end)
end)
