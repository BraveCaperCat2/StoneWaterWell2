local waterwell = table.deepcopy(data.raw["offshore-pump"]["offshore-pump"])
waterwell.name = "stone-waterwell"
waterwell.icon = "__StoneWaterWell__/graphics/stone-waterwell.icon.png"
waterwell.icon_size = 32
waterwell.icon_mipmaps = 1
waterwell.max_health = 400
-- waterwell.corpse = "water-well-remnants"
-- waterwell.dying_explosion = "pumpjack-explosion"
-- waterwell.flags = {"placeable-neutral", "player-creation", "filter-directions"}
waterwell.flags = { "placeable-neutral", "player-creation" }
waterwell.minable = {mining_time = 1.5, result = "stone-waterwell"}
waterwell.fast_replaceable_group = "stone-waterwell"
waterwell.pumping_speed = 20 -- 1200 water/s 
waterwell.tile_width = 3
waterwell.tile_height = 3
waterwell.collision_mask = 
{
    layers={object=true, train=true, is_object=true, is_lower_object=true} -- make same as example in docs?
}
waterwell.tile_buildability_rules = nil
waterwell.adjacent_tile_collision_test = { "ground-tile" }
waterwell.adjacent_tile_collision_mask = nil

if mods["space-age"] 
then
    waterwell.surface_conditions = 
    {
        {
          property = "pressure",
          min = 1000,
          max = 2000
        }
    }
end

waterwell.water_reflection = nil
waterwell.working_sound = 
{
    sound = {filename = "__base__/sound/pumpjack.ogg", volume = 0.3},
    max_sounds_per_type = 3,
    audible_distance_modifier = 0.6,
    fade_in_ticks = 4,
    fade_out_ticks = 10
}

waterwell.energy_source = 
{
  type = "electric",
  usage_priority = "secondary-input"
}
waterwell.energy_usage = "300kW"

waterwell.graphics_set =
{  
  base_render_layer = "ground-patch",
  animation =
  {
    north =
    {
      layers =
      {
        {
          filename = "__StoneWaterWell__/graphics/stone_waterWell_north.png",
          priority = "extra-high",
          line_length = 1,
          frame_count = 1,
          animation_speed = 0.25,
          width = 256,
          height = 256,
          shift = {0.18, 0.4}, -- good
          scale = 0.65 -- good
        }
      }
    },
    east =
    {
      layers =
      {
        {
          filename = "__StoneWaterWell__/graphics/stone_waterWell_east.png",
          priority = "extra-high",
          line_length = 1,
          frame_count = 1,
          animation_speed = 0.25,
          width = 256,
          height = 256,
          shift = {0.18, 0.4}, -- good
          scale = 0.65 -- good
        }
      }
    },
    south =
    {
      layers =
      {
        {
          filename = "__StoneWaterWell__/graphics/stone_waterWell_south.png",
          priority = "extra-high",
          line_length = 1,
          frame_count = 1,
          animation_speed = 0.25,
          width = 256,
          height = 256,
          shift = {0.18, 0.4}, -- good
          scale = 0.65 -- good
        }
      }
    },
    west =
    {
      layers =
      {
        {
          filename = "__StoneWaterWell__/graphics/stone_waterWell_west.png",
          priority = "extra-high",
          line_length = 1,
          frame_count = 1,
          animation_speed = 0.25,
          width = 256,
          height = 256,
          shift = {0.18, 0.4}, -- good
          scale = 0.65 -- good
        }
      }
    }
  },
} -- end graphics set


waterwell.collision_box = {{-1.4, -1.4}, {1.4, 1.4}}
waterwell.selection_box = {{-1.5, -1.5}, {1.5, 1.5}}
waterwell.fluid_source_offset = {0, 0} -- yes

waterwell.fluid_box = 
  {
    filter = "water", -- important
    volume = 100,     -- important
    production_type = "output",
    base_area = 1,  -- important
    base_level = 1, -- important
    pipe_connections = 
    {
      { -- offsets important, s/b close to 1.5? Just under 1.5 for 3x3 object
        positions = {{0, 1.4}, {-1.4, 0}, {0, -1.4}, {1.4, 0}},
        direction = defines.direction.south,
        flow_direction="output"
      }
    }
  }
  
waterwell.placeable_position_visualization = nil
-- waterwell.placeable_position_visualization =
  -- {
    -- filename = "__core__/graphics/cursor-boxes-32x32.png",
    -- priority = "extra-high-no-scale",
    -- width = 64,
    -- height = 64,
    -- scale = 0.5,
    -- x = 3*64
  -- }


waterwell.circuit_wire_connection_points = circuit_connector_definitions["storage-tank"].points
waterwell.circuit_connector_sprites = circuit_connector_definitions["storage-tank"].sprites
waterwell.circuit_wire_max_distance = default_circuit_wire_max_distance


-- item declaration
local item = 
{
  type = "item",
  name = "stone-waterwell",
  icon = "__StoneWaterWell__/graphics/stone_waterWell_icon.png",
  icon_size = 32,
  subgroup = "energy-pipe-distribution",
  order = "a[pipe]-d[stone-waterwell]",
  -- subgroup = "extraction-machine",
  -- order = "b[fluids]-a[stone-waterwell]",
  place_result = "stone-waterwell",
  stack_size = 4,
  weight = 50*kg  -- for space age
}

-- entity recipe
local recipe = 
{
  type = "recipe",
  name = "stone-waterwell",
  ingredients = 
  {
    {type = "item", name = "iron-stick", amount = 4},
    {type = "item", name = "stone-brick", amount = 8},
    {type = "item", name = "stone", amount = 40},
    {type = "item", name = "pipe-to-ground", amount = 1},
    {type = "item", name = "offshore-pump", amount = 1}
  },
  results = {{type="item", name="stone-waterwell", amount=1}}
}

data:extend ({item, recipe, waterwell})

