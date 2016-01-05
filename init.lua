minetest.register_node("fagmod:fagblock", {
    tiles = {"fagblock.png"},
    inventory_image = "fagblock.png",
    light_source = 15,
    groups = {
        fleshy = 15,
        cracky = 1,
        bouncy = 1000,
        fall_damage_add_percent = -100
    }
})

minetest.register_node("fagmod:fagmaker", {
    description = "A fagblock converter",
    inventory_image = "fagblock.png",
    on_use = function(itemstack, user, pointed_thing)
        local pos = minetest.get_pointed_thing_position(pointed_thing, false)
        if pos ~= nil then
            minetest.add_node(pos, {name="fagmod:fagblock"})
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