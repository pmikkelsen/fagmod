minetest.register_node("fagmod:fagblock", {
    tiles = {"fagblock.png"},
    inventory_image = "fagblock.png",
    light_source = 15,
    groups = {
        bouncy = 100,
        fall_damage_add_percent = -100,
        oddly_breakable_by_hand = 10
    }
})

minetest.register_node("fagmod:kloppblock", {
    tiles = {"kloppblock.png"},
    inventory_image = "kloppblock.png",
    light_source = 15,
    groups = {
        bouncy = 100,
        fall_damage_add_percent = -100,
        oddly_breakable_by_hand = 10
    }
})

minetest.register_node("fagmod:fagmaker", {
    description = "A fagblock converter",
    inventory_image = "fagblock.png",
    on_use = function(itemstack, user, pointed_thing)
        local pos = minetest.get_pointed_thing_position(pointed_thing, false)
        if pos ~= nil then
            minetest.set_node(pos, {name="fagmod:fagblock"})
        end
        return itemstack
    end
})

minetest.register_craft({
    output = "fagmod:fagmaker",
    recipe = {
        {"default:dirt", "default:dirt", "default:dirt"},
        {"","",""},
        {"","",""}
    }
})

minetest.register_abm({
    nodenames = {"fagmod:fagblock"},
    interval = 1,
    chance = 5,
    action = function(pos, node, active_obj_cnt, active_obj_cnt_wider)
        minetest.set_node(pos, {name = "fagmod:kloppblock"})
    end
})

minetest.register_abm({
    nodenames = {"fagmod:kloppblock"},
    interval = 1,
    chance = 5,
    action = function(pos, node, active_obj_cnt, active_obj_cnt_wider)
        minetest.set_node(pos, {name = "fagmod:fagblock"})
    end
})
