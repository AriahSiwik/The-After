# Lifegain Ritual

execute at @e[type=minecraft:item,nbt={Item:{id:"minecraft:diamond",Count:64b}}] if block ~ ~ ~ minecraft:water_cauldron[level=3] if block ~ ~-1 ~ minecraft:shroomlight if block ~-1 ~-1 ~ minecraft:soul_sand if block ~1 ~-1 ~ minecraft:soul_sand if block ~ ~-1 ~-1 minecraft:soul_sand if block ~ ~-1 ~1 minecraft:soul_sand if block ~-1 ~-1 ~-1 #minecraft:wooden_slabs[type=bottom] if block ~1 ~-1 ~-1 #minecraft:wooden_slabs[type=bottom] if block ~-1 ~-1 ~1 #minecraft:wooden_slabs[type=bottom] if block ~1 ~-1 ~1 #minecraft:wooden_slabs[type=bottom] run summon area_effect_cloud ~ ~ ~ {Duration:1, Tags:["rit_life"]}
execute at @e[type=area_effect_cloud,nbt={Tags:["rit_life"]}] run scoreboard players add @p lives 1
execute at @e[type=area_effect_cloud,nbt={Tags:["rit_life"]}] run particle minecraft:witch ~ ~1 ~ 0 0 0 1 200
execute at @e[type=area_effect_cloud,nbt={Tags:["rit_life"]}] run playsound minecraft:block.respawn_anchor.set_spawn block @a ~ ~ ~ 1 2
execute at @e[type=area_effect_cloud,nbt={Tags:["rit_life"]}] run kill @e[limit=1,type=minecraft:item,nbt={Item:{id:"minecraft:diamond",Count:64b}},distance=..1]
execute at @e[type=area_effect_cloud,nbt={Tags:["rit_life"]}] run setblock ~-1 ~-1 ~ minecraft:soul_soil
execute at @e[type=area_effect_cloud,nbt={Tags:["rit_life"]}] run setblock ~1 ~-1 ~ minecraft:soul_soil
execute at @e[type=area_effect_cloud,nbt={Tags:["rit_life"]}] run setblock ~ ~-1 ~-1 minecraft:soul_soil
execute at @e[type=area_effect_cloud,nbt={Tags:["rit_life"]}] run setblock ~ ~-1 ~1 minecraft:soul_soil
kill @e[type=area_effect_cloud,nbt={Tags:["rit_life"]}]





# Resurrection Ritual
execute at @e[type=armor_stand] if block ~ ~-1 ~-2 minecraft:nether_wart_block if block ~-1 ~-1 ~-1 minecraft:gold_block if block ~ ~-1 ~-1 minecraft:crimson_stem if block ~1 ~-1 ~-1 minecraft:gold_block if block ~-2 ~-1 ~ minecraft:nether_wart_block if block ~-1 ~-1 ~ minecraft:crimson_stem if block ~1 ~-1 ~ minecraft:crimson_stem if block ~2 ~-1 ~ minecraft:nether_wart_block if block ~-1 ~-1 ~1 minecraft:gold_block if block ~ ~-1 ~1 minecraft:crimson_stem if block ~1 ~-1 ~1 minecraft:gold_block if block ~ ~-1 ~2 minecraft:nether_wart_block if block ~-2 ~ ~-2 minecraft:crimson_stem if block ~-1 ~ ~-2 minecraft:red_nether_brick_slab[type=bottom] if block ~1 ~ ~-2 minecraft:red_nether_brick_slab[type=bottom] if block ~2 ~ ~-2 minecraft:crimson_stem if block ~-2 ~ ~-1 minecraft:red_nether_brick_slab[type=bottom] if block ~2 ~ ~-1 minecraft:red_nether_brick_slab[type=bottom] if block ~ ~ ~ minecraft:polished_blackstone_brick_slab[type=bottom] if block ~-2 ~ ~1 minecraft:red_nether_brick_slab[type=bottom] if block ~2 ~ ~1 minecraft:red_nether_brick_slab[type=bottom] if block ~-2 ~ ~2 minecraft:crimson_stem if block ~-1 ~ ~2 minecraft:red_nether_brick_slab[type=bottom] if block ~1 ~ ~2 minecraft:red_nether_brick_slab[type=bottom] if block ~2 ~ ~2 minecraft:crimson_stem if block ~-2 ~1 ~-2 minecraft:red_nether_brick_wall if block ~2 ~1 ~-2 minecraft:red_nether_brick_wall if block ~-2 ~1 ~2 minecraft:red_nether_brick_wall if block ~2 ~1 ~2 minecraft:red_nether_brick_wall if block ~-2 ~2 ~-2 minecraft:netherrack if block ~2 ~2 ~-2 minecraft:netherrack if block ~-2 ~2 ~2 minecraft:netherrack if block ~2 ~2 ~2 minecraft:netherrack if block ~-2 ~3 ~-2 minecraft:fire if block ~-2 ~3 ~2 minecraft:fire if block ~2 ~3 ~-2 minecraft:fire if block ~2 ~3 ~2 minecraft:fire unless entity @e[type=area_effect_cloud,nbt={Tags:["rit_res"]}] run summon area_effect_cloud ~ ~ ~ {Duration:180, Tags:["rit_res"]}

execute at @e[type=area_effect_cloud,nbt={Age:0,Tags:["rit_res"]}] run scoreboard objectives add rit_res dummy
execute at @e[type=area_effect_cloud,nbt={Age:0,Tags:["rit_res"]}] as @a[distance=..3,gamemode=!spectator] run scoreboard players add count rit_res 1
execute at @e[type=area_effect_cloud,nbt={Age:0,Tags:["rit_res"]}] run tag @p[distance=..8,gamemode=spectator] add rit_res
execute unless entity @p[tag=rit_res] run kill @e[type=area_effect_cloud,nbt={Age:0,Tags:["rit_res"]}]
#TODO next line change 1 to 2
execute unless score count rit_res matches 2.. run kill @e[type=area_effect_cloud,nbt={Age:0,Tags:["rit_res"]}]
execute at @e[type=area_effect_cloud,nbt={Age:0,Tags:["rit_res"]}] run scoreboard players remove @a[distance=..3,gamemode=!spectator] lives 1 
#TODO next line change 0 to -1
execute if entity @e[type=area_effect_cloud,nbt={Age:0,Tags:["rit_res"]}] run scoreboard players set lives rit_res -1
execute if entity @e[type=area_effect_cloud,nbt={Age:0,Tags:["rit_res"]}] run scoreboard players operation lives rit_res += count rit_res

execute at @e[type=area_effect_cloud,nbt={Age:0,Tags:["rit_res"]}] run data modify entity @e[type=armor_stand,distance=..2,limit=1] Tags append value "rit_res"
execute at @e[type=area_effect_cloud,nbt={Age:0,Tags:["rit_res"]}] run data modify entity @e[type=armor_stand,nbt={Tags:["rit_res"]},limit=1] NoBasePlate set value true
execute at @e[type=area_effect_cloud,nbt={Age:0,Tags:["rit_res"]}] run data modify entity @e[type=armor_stand,nbt={Tags:["rit_res"]},limit=1] NoGravity set value true
execute at @e[type=area_effect_cloud,nbt={Age:0,Tags:["rit_res"]}] run data modify entity @e[type=armor_stand,nbt={Tags:["rit_res"]},limit=1] ShowArms set value true
execute at @e[type=area_effect_cloud,nbt={Age:0,Tags:["rit_res"]}] run data modify entity @e[type=armor_stand,nbt={Tags:["rit_res"]},limit=1] Invulnerable set value true
execute at @e[type=armor_stand,nbt={Tags:["rit_res"]}] run particle minecraft:soul ~ ~1 ~ 0.4 0.7 0.4 0.02 1
execute at @e[type=armor_stand,nbt={Tags:["rit_res"]}] run particle minecraft:ash ~ ~2 ~ 0.4 0.4 0.4 0.02 1
execute at @e[type=armor_stand,nbt={Tags:["rit_res"]}] run tp @e[type=armor_stand,nbt={Tags:["rit_res"]}] ~ ~0.01 ~ ~2 ~
# execute at @e[type=armor_stand,nbt={Tags:["rit_res"]}] run tp @p[tag=rit_res] ~ ~ ~ ~ ~
execute as @p[tag=rit_res] run spectate @e[type=armor_stand,nbt={Tags:["rit_res"]},limit=1]

execute if entity @e[type=area_effect_cloud,nbt={Age:179,Tags:["rit_res"]}] run kill @e[type=armor_stand,nbt={Tags:["rit_res"]}]
execute if entity @e[type=area_effect_cloud,nbt={Age:179,Tags:["rit_res"]}] run gamemode survival @p[tag=rit_res]
execute if entity @e[type=area_effect_cloud,nbt={Age:179,Tags:["rit_res"]}] run scoreboard players operation @p[tag=rit_res] lives = lives rit_res

execute unless entity @e[type=area_effect_cloud,nbt={Tags:["rit_res"]}] run scoreboard objectives remove rit_res
execute unless entity @e[type=area_effect_cloud,nbt={Tags:["rit_res"]}] run tag @a[tag=rit_res] remove rit_res



# Command Ritual
execute as @e[type=minecraft:item,nbt={Item:{id:"minecraft:player_head"}}] at @s positioned ~ ~-1 ~ unless entity @e[tag=rit_com_active,distance=..1] if entity @p[scores={lives=4..},distance=..4.5] if entity @e[type=minecraft:item,nbt={Item:{id:"minecraft:written_book",tag:{title:"Command"}}},nbt=!{Item:{id:"minecraft:written_book",tag:{title:"Command",display:{}}}},distance=..1.5] positioned ~ ~1 ~ if block ~-.5 ~-1 ~.5 minecraft:black_glazed_terracotta[facing=west] if block ~.5 ~-1 ~-.5 minecraft:black_glazed_terracotta[facing=east] if block ~-.5 ~-1 ~-.5 minecraft:black_glazed_terracotta[facing=north] if block ~.5 ~-1 ~.5 minecraft:black_glazed_terracotta[facing=south] run tag @s add rit_com
execute as @e[type=minecraft:item,nbt={Item:{id:"minecraft:player_head"}}] at @s positioned ~ ~-1 ~ unless entity @e[tag=rit_com_active,distance=..1] if entity @p[scores={lives=4..},distance=..4.5] if entity @e[type=minecraft:item,nbt={Item:{id:"minecraft:written_book",tag:{title:"Command"}}},nbt=!{Item:{id:"minecraft:written_book",tag:{title:"Command",display:{}}}},distance=..1.5] positioned ~ ~1 ~ if block ~-.5 ~-1 ~.5 minecraft:black_glazed_terracotta[facing=east] if block ~.5 ~-1 ~-.5 minecraft:black_glazed_terracotta[facing=west] if block ~-.5 ~-1 ~-.5 minecraft:black_glazed_terracotta[facing=south] if block ~.5 ~-1 ~.5 minecraft:black_glazed_terracotta[facing=north] run tag @s add rit_com
execute at @e[type=minecraft:item,tag=rit_com] run tag @e[type=minecraft:item,nbt={Item:{id:"minecraft:written_book",tag:{title:"Command"}}},distance=..1.5,limit=1] add rit_com_book

data modify entity @e[type=minecraft:item,tag=rit_com_book,limit=1] Item.tag.CanDestroy set from entity @e[type=minecraft:item,tag=rit_com,limit=1] Item.tag.SkullOwner.Id

execute as @e[type=minecraft:item,nbt={Item:{id:"minecraft:written_book"}}] if data entity @s Item.tag.CanDestroy

execute as @e[type=minecraft:item,nbt={Item:{id:"minecraft:written_book"}}] if data entity @s Item.tag.CanDestroy run scoreboard objectives add uuid0 dummy
execute as @e[type=minecraft:item,nbt={Item:{id:"minecraft:written_book"}}] if data entity @s Item.tag.CanDestroy run scoreboard objectives add uuid1 dummy
execute as @e[type=minecraft:item,nbt={Item:{id:"minecraft:written_book"}}] if data entity @s Item.tag.CanDestroy run scoreboard objectives add uuid2 dummy
execute as @e[type=minecraft:item,nbt={Item:{id:"minecraft:written_book"}}] if data entity @s Item.tag.CanDestroy run scoreboard objectives add uuid3 dummy
execute as @e[type=minecraft:item,nbt={Item:{id:"minecraft:written_book"}}] if data entity @s Item.tag.CanDestroy as @a store result score @s uuid0 run data get entity @s UUID[0]
execute as @e[type=minecraft:item,nbt={Item:{id:"minecraft:written_book"}}] if data entity @s Item.tag.CanDestroy as @a store result score @s uuid1 run data get entity @s UUID[1]
execute as @e[type=minecraft:item,nbt={Item:{id:"minecraft:written_book"}}] if data entity @s Item.tag.CanDestroy as @a store result score @s uuid2 run data get entity @s UUID[2]
execute as @e[type=minecraft:item,nbt={Item:{id:"minecraft:written_book"}}] if data entity @s Item.tag.CanDestroy as @a store result score @s uuid3 run data get entity @s UUID[3]
execute as @e[type=minecraft:item,nbt={Item:{id:"minecraft:written_book"}}] if data entity @s Item.tag.CanDestroy store result score @s uuid0 run data get entity @s Item.tag.CanDestroy[0]
execute as @e[type=minecraft:item,nbt={Item:{id:"minecraft:written_book"}}] if data entity @s Item.tag.CanDestroy store result score @s uuid1 run data get entity @s Item.tag.CanDestroy[1]
execute as @e[type=minecraft:item,nbt={Item:{id:"minecraft:written_book"}}] if data entity @s Item.tag.CanDestroy store result score @s uuid2 run data get entity @s Item.tag.CanDestroy[2]
execute as @e[type=minecraft:item,nbt={Item:{id:"minecraft:written_book"}}] if data entity @s Item.tag.CanDestroy store result score @s uuid3 run data get entity @s Item.tag.CanDestroy[3]

execute as @e[type=minecraft:item,nbt={Item:{id:"minecraft:written_book"}}] if data entity @s Item.tag.CanDestroy at @s as @a if score @e[type=minecraft:item,nbt={Item:{id:"minecraft:written_book"}},sort=nearest,limit=1] uuid0 = @s uuid0 if entity @s[nbt=!{Health:0f}] run data modify entity @e[type=minecraft:item,nbt={Item:{id:"minecraft:written_book"}},sort=nearest,limit=1] Item.tag.EntityTag.Pos set from entity @s Pos
execute as @e[type=minecraft:item,nbt={Item:{id:"minecraft:written_book"}}] if data entity @s Item.tag.CanDestroy at @s as @a if score @e[type=minecraft:item,nbt={Item:{id:"minecraft:written_book"}},sort=nearest,limit=1] uuid0 = @s uuid0 if entity @s[nbt={Health:0f}] run data modify entity @e[type=minecraft:item,nbt={Item:{id:"minecraft:written_book"}},sort=nearest,limit=1] Item.tag.EntityTag.Pos set value [0d, -1d, 0d]
execute as @e[type=minecraft:item,nbt={Item:{id:"minecraft:written_book"}}] if data entity @s Item.tag.CanDestroy at @s as @a if score @e[type=minecraft:item,nbt={Item:{id:"minecraft:written_book"}},sort=nearest,limit=1] uuid0 = @s uuid0 if entity @s[nbt=!{Health:0f}] run data modify entity @e[type=minecraft:item,nbt={Item:{id:"minecraft:written_book"}},sort=nearest,limit=1] Item.tag.EntityTag.Dimension set from entity @s Dimension
execute as @e[type=minecraft:item,nbt={Item:{id:"minecraft:written_book"}}] if data entity @s Item.tag.CanDestroy at @s as @a if score @e[type=minecraft:item,nbt={Item:{id:"minecraft:written_book"}},sort=nearest,limit=1] uuid0 = @s uuid0 if entity @s[nbt={Health:0f}] run data modify entity @e[type=minecraft:item,nbt={Item:{id:"minecraft:written_book"}},sort=nearest,limit=1] Item.tag.EntityTag.Dimension set value "minecraft:overworld"

# execute if entity @e[type=minecraft:item,nbt={Item:{id:"minecraft:written_book",tag:{SkullOwner:{}}}}] as @a if score book uuid0 = @s uuid0 if score book uuid1 = @s uuid1 if score book uuid2 = @s uuid2 if score book uuid3 = @s uuid3 run tag @s add @e[]

scoreboard objectives remove uuid0
scoreboard objectives remove uuid1
scoreboard objectives remove uuid2
scoreboard objectives remove uuid3

execute unless entity @e[type=minecraft:item,tag=rit_com_book,nbt={Item:{tag:{EntityTag:{}}}}] run tag @e[type=minecraft:item,tag=rit_com] remove rit_com

# Creating Armor Stands
execute as @e[type=minecraft:item,tag=rit_com] at @s positioned ~.5 ~ ~.5 align xyz run summon armor_stand ~ ~-1 ~ {Marker:1b,Invisible:1b,Tags:["rit_com_init"]}
execute at @e[tag=rit_com_init] run summon minecraft:armor_stand ~ ~ ~ {Marker:1b,Invisible:1b,Tags:["rit_com_rotate"]}
execute at @e[tag=rit_com_init] run summon minecraft:armor_stand ~ ~ ~ {Marker:1b,Invisible:1b,Tags:["rit_com_circle"]}
execute as @e[tag=rit_com_init] run data modify entity @s ArmorItems set value [{id:"minecraft:player_head",Count:1b},{},{},{id:"minecraft:player_head",Count:1b}]
execute as @e[tag=rit_com_init] at @s run data modify entity @s ArmorItems[3] set from entity @e[type=minecraft:item,tag=rit_com,limit=1,sort=nearest] Item
execute as @e[tag=rit_com_init] at @s run data modify entity @s ArmorItems[0].tag.SkullOwner.Id set from entity @p[scores={lives=5..}] UUID
execute as @e[tag=rit_com_init] run data modify entity @e[tag=rit_com_book,limit=1,sort=nearest] Item.tag.CanDestroy append from entity @s UUID[0]
execute as @e[tag=rit_com_init] run data modify entity @e[tag=rit_com_book,limit=1,sort=nearest] Item.tag.CanDestroy append from entity @s UUID[1]
execute as @e[tag=rit_com_init] run data modify entity @e[tag=rit_com_book,limit=1,sort=nearest] Item.tag.CanDestroy append from entity @s UUID[2]
execute as @e[tag=rit_com_init] run data modify entity @e[tag=rit_com_book,limit=1,sort=nearest] Item.tag.CanDestroy append from entity @s UUID[3]
execute at @e[tag=rit_com_init] run forceload add ~ ~

execute as @e[tag=rit_com_init] run tag @s add rit_com_active
execute as @e[tag=rit_com_init] run tag @s remove rit_com_init

#Head Effects
execute as @e[tag=rit_com_active] at @s run tp @s ~ ~ ~ ~2 ~
execute as @e[tag=rit_com_rotate] at @s run tp @s ~ ~ ~ ~10 ~
execute as @e[tag=rit_com_rotate] run data modify entity @s Rotation[1] set from entity @s Rotation[0]
execute as @e[tag=rit_com_circle] at @s at @e[tag=rit_com_rotate,limit=1,sort=nearest] run tp @s ^ ^ ^0.1
execute as @e[tag=rit_com_active] at @s run data modify entity @s Pos[1] set from entity @e[tag=rit_com_circle,limit=1,sort=nearest] Pos[1]

execute as @e[tag=rit_com_active] at @s run particle minecraft:enchant ~ ~2.8 ~ 0 0 0 1 1


execute at @e[type=minecraft:item,tag=rit_com] run scoreboard players remove @p[scores={lives=4..}] lives 4 

execute as @e[tag=rit_trap_spawn] at @s run data modify entity @s ArmorItems[0].tag.SkullOwner.Id set from entity @p[tag=rit_trap_placed] UUID

execute if entity @e[type=minecraft:item,tag=rit_com] run data modify entity @e[type=minecraft:item,tag=rit_com_book,limit=1] Item.tag.pages append value '[{"text":"This page is here for you to either mark your task as completed, or refuse it all together and suffer the loss of five of your lives.\\n\\n"},{"text":"Task Complete\\n","color":"green","bold":true,"clickEvent":{"action":"run_command","value":"/trigger rit_com_complete"}},{"text":"Refuse Task","color":"red","bold":true,"clickEvent":{"action":"run_command","value":"/trigger rit_com_reject"}}]'
execute if entity @e[type=minecraft:item,tag=rit_com] run data modify entity @e[type=minecraft:item,tag=rit_com_book,limit=1] Item.tag.display.Name set value '{"text":"Command","color":"red"}'
execute if entity @e[type=minecraft:item,tag=rit_com] run data modify entity @e[type=minecraft:item,tag=rit_com_book,limit=1] Item.tag.RepairCost set value 2147483647

execute as @e[type=minecraft:item,nbt={Item:{id:"minecraft:written_book",tag:{EntityTag:{}}}}] run data modify entity @s Owner set from entity @s Item.tag.CanDestroy
execute as @e[type=minecraft:item,nbt={Item:{id:"minecraft:written_book",tag:{EntityTag:{}}}}] run data modify entity @s PickupDelay set value 0
execute as @e[type=minecraft:item,nbt={Item:{id:"minecraft:written_book",tag:{EntityTag:{}}}}] run data modify entity @s NoGravity set value false
execute as @e[type=minecraft:item,nbt={Item:{id:"minecraft:written_book",tag:{EntityTag:{}}}}] run data modify entity @s Invulnerable set value 1b
execute as @e[type=minecraft:item,nbt={Item:{id:"minecraft:written_book",tag:{EntityTag:{}}}}] run data modify entity @s Age set value -32768s
execute as @e[type=minecraft:item,nbt={Item:{id:"minecraft:written_book",tag:{EntityTag:{Dimension:"minecraft:overworld"}}}}] at @s in minecraft:overworld run tp ~ ~ ~ 
execute as @e[type=minecraft:item,nbt={Item:{id:"minecraft:written_book",tag:{EntityTag:{Dimension:"minecraft:the_nether"}}}}] at @s in minecraft:the_nether run tp ~ ~ ~ 
execute as @e[type=minecraft:item,nbt={Item:{id:"minecraft:written_book",tag:{EntityTag:{Dimension:"minecraft:the_end"}}}}] at @s in minecraft:the_end run tp ~ ~ ~ 
execute as @e[type=minecraft:item,nbt={Item:{id:"minecraft:written_book",tag:{EntityTag:{}}}}] run data modify entity @s Pos set from entity @s Item.tag.EntityTag.Pos
execute at @e[type=minecraft:item,nbt={Item:{id:"minecraft:written_book",tag:{EntityTag:{}}}},tag=rit_com_book] run title @p title {"text":"Commanded", "color":"red"}
execute at @e[type=minecraft:item,nbt={Item:{id:"minecraft:written_book",tag:{EntityTag:{}}}},tag=rit_com_book] run title @p subtitle {"text":"Follow the instructions in your inventory", "color":"red"}

execute as @e[tag=rit_com_book] run tag @s remove rit_com_book

# tp @e[type=minecraft:item,tag=rit_com_book,limit=1] @e[type=minecraft:player,tag=rit_com,limit=1]

execute at @e[type=minecraft:item,tag=rit_com] run summon minecraft:lightning_bolt
kill @e[type=minecraft:item,tag=rit_com]

execute as @e[tag=rit_com] run tag @s remove rit_com

execute as @a run trigger rit_com_complete add 0
execute as @a run trigger rit_com_reject add 0
execute as @a[nbt={SelectedItem:{id:"minecraft:written_book",tag:{title:"Command",display:{Name:'{"text":"Command","color":"red"}'}}}}] run scoreboard players enable @s rit_com_complete
execute as @a[nbt={SelectedItem:{id:"minecraft:written_book",tag:{title:"Command",display:{Name:'{"text":"Command","color":"red"}'}}}}] run scoreboard players enable @s rit_com_reject

execute as @a[scores={rit_com_complete=1..}] run tag @s add rit_com_done
execute as @a[scores={rit_com_reject=1..}] run tag @s add rit_com_done

execute if entity @a[tag=rit_com_done] run scoreboard objectives add uuid0 dummy
execute if entity @a[tag=rit_com_done] run scoreboard objectives add uuid1 dummy
execute if entity @a[tag=rit_com_done] run scoreboard objectives add uuid2 dummy
execute if entity @a[tag=rit_com_done] run scoreboard objectives add uuid3 dummy
execute as @a[tag=rit_com_done] store result score @s uuid0 run data get entity @s SelectedItem.tag.CanDestroy[4]
execute as @a[tag=rit_com_done] store result score @s uuid1 run data get entity @s SelectedItem.tag.CanDestroy[5]
execute as @a[tag=rit_com_done] store result score @s uuid2 run data get entity @s SelectedItem.tag.CanDestroy[6]
execute as @a[tag=rit_com_done] store result score @s uuid3 run data get entity @s SelectedItem.tag.CanDestroy[7]
execute if entity @a[tag=rit_com_done] as @e[tag=rit_com_active] store result score @s uuid0 run data get entity @s UUID[0]
execute if entity @a[tag=rit_com_done] as @e[tag=rit_com_active] store result score @s uuid1 run data get entity @s UUID[1]
execute if entity @a[tag=rit_com_done] as @e[tag=rit_com_active] store result score @s uuid2 run data get entity @s UUID[2]
execute if entity @a[tag=rit_com_done] as @e[tag=rit_com_active] store result score @s uuid3 run data get entity @s UUID[3]

execute as @e[tag=rit_com_active] at @a[tag=rit_com_done] if score @s uuid0 = @p[tag=rit_com_done] uuid0 if score @s uuid1 = @p[tag=rit_com_done] uuid1 if score @s uuid2 = @p[tag=rit_com_done] uuid2 if score @s uuid3 = @p[tag=rit_com_done] uuid3 run tag @s add rit_com_destroy

scoreboard objectives remove uuid0
scoreboard objectives remove uuid1
scoreboard objectives remove uuid2
scoreboard objectives remove uuid3

execute as @e[tag=rit_com_destroy] if entity @a[scores={rit_com_complete=1..}] run tag @s add rit_com_complete
execute as @e[tag=rit_com_destroy] if entity @a[scores={rit_com_reject=1..}] run tag @s add rit_com_reject

execute as @a[scores={rit_com_complete=1..}] at @s run playsound minecraft:block.bell.resonate player @s ~ ~ ~ 1 1.4
execute as @a[scores={rit_com_reject=1..}] at @s run playsound minecraft:block.beacon.deactivate player @s ~ ~ ~ 1 0.7

execute as @e[tag=rit_com_destroy] run data modify entity @s ArmorItems[3] set value {}

# TODO: Tell the caster this is complete
execute if entity @e[tag=rit_com_destroy] run scoreboard objectives add uuid0 dummy
execute if entity @e[tag=rit_com_destroy] run scoreboard objectives add uuid1 dummy
execute if entity @e[tag=rit_com_destroy] run scoreboard objectives add uuid2 dummy
execute if entity @e[tag=rit_com_destroy] run scoreboard objectives add uuid3 dummy
execute as @e[tag=rit_com_destroy] store result score @s uuid0 run data get entity @s ArmorItems[0].tag.SkullOwner.Id[0]
execute as @e[tag=rit_com_destroy] store result score @s uuid1 run data get entity @s ArmorItems[0].tag.SkullOwner.Id[1]
execute as @e[tag=rit_com_destroy] store result score @s uuid2 run data get entity @s ArmorItems[0].tag.SkullOwner.Id[2]
execute as @e[tag=rit_com_destroy] store result score @s uuid3 run data get entity @s ArmorItems[0].tag.SkullOwner.Id[3]
execute if entity @e[tag=rit_com_destroy] as @a store result score @s uuid0 run data get entity @s UUID[0]
execute if entity @e[tag=rit_com_destroy] as @a store result score @s uuid1 run data get entity @s UUID[1]
execute if entity @e[tag=rit_com_destroy] as @a store result score @s uuid2 run data get entity @s UUID[2]
execute if entity @e[tag=rit_com_destroy] as @a store result score @s uuid3 run data get entity @s UUID[3]

execute as @a at @e[tag=rit_com_destroy] if score @s uuid0 = @e[tag=rit_com_destroy,sort=nearest,limit=1] uuid0 if score @s uuid1 = @e[tag=rit_com_destroy,sort=nearest,limit=1] uuid1 if score @s uuid2 = @e[tag=rit_com_destroy,sort=nearest,limit=1] uuid2 if score @s uuid3 = @e[tag=rit_com_destroy,sort=nearest,limit=1] uuid3 run tag @s add rit_com_title
execute as @a at @e[tag=rit_com_destroy] if score @s uuid0 = @e[tag=rit_com_destroy,sort=nearest,limit=1] uuid0 if score @s uuid1 = @e[tag=rit_com_destroy,sort=nearest,limit=1] uuid1 if score @s uuid2 = @e[tag=rit_com_destroy,sort=nearest,limit=1] uuid2 if score @s uuid3 = @e[tag=rit_com_destroy,sort=nearest,limit=1] uuid3 run tag @e[tag=rit_com_destroy,sort=nearest,limit=1] add rit_com_dead

execute if entity @e[tag=rit_com_complete,tag=rit_com_dead] as @a[tag=rit_com_title] at @s run playsound minecraft:block.bell.resonate player @s ~ ~ ~ 1 1.4
execute if entity @e[tag=rit_com_reject,tag=rit_com_dead] as @a[tag=rit_com_title] at @s run playsound minecraft:block.beacon.deactivate player @s ~ ~ ~ 1 0.7

execute if entity @e[tag=rit_com_complete,tag=rit_com_dead] run title @a[tag=rit_com_title] title {"text":"Command","color":"green"}
execute if entity @e[tag=rit_com_complete,tag=rit_com_dead] run title @a[tag=rit_com_title] subtitle {"text":"Your command has been completed!","color":"green"}
execute if entity @e[tag=rit_com_reject,tag=rit_com_dead] run title @a[tag=rit_com_title] title {"text":"Command","color":"red"}
execute if entity @e[tag=rit_com_reject,tag=rit_com_dead] run title @a[tag=rit_com_title] subtitle {"text":"Your command has been rejected!","color":"red"}
execute if entity @a[tag=rit_com_title] at @e[tag=rit_com_dead] run forceload remove ~ ~
execute if entity @a[tag=rit_com_title] if entity @e[tag=rit_com_dead] at @e[tag=rit_com_active] run forceload add ~ ~
execute at @e[tag=rit_com_dead] run kill @e[tag=rit_com_rotate,limit=1,sort=nearest]
execute at @e[tag=rit_com_dead] run kill @e[tag=rit_com_circle,limit=1,sort=nearest]
kill @e[tag=rit_com_dead]

tag @a remove rit_com_title

# execute as @a[tag=rit_com_done] run replaceitem entity @s weapon air
execute as @a[tag=rit_com_done] run item replace entity @s weapon with air
execute as @a[scores={rit_com_reject=1..}] run scoreboard players remove @s lives 5
execute as @a[tag=rit_com_done] run tag @s remove rit_com_done

scoreboard players set @a[scores={rit_com_complete=1..}] rit_com_complete 0
scoreboard players set @a[scores={rit_com_reject=1..}] rit_com_reject 0

# execute at @e[type=minecraft:item,nbt={Item:{id:"minecraft:written_book",tag:{title:"Command",display:{Name:'{"text":"Command","color":"red"}'}}}}] 





# Trap Ritual
execute as @a unless score @s placed_obsidian = @s placed_crying run tag @s add rit_trap_placed

execute at @a[tag=rit_trap_placed] positioned ^ ^1.6 ^2.5 align xyz run summon minecraft:armor_stand ~-4 ~-4 ~-4 {PortalCooldown:8,Marker:1b,Invisible:1b,Tags:["rit_trap_spawn"]}
execute at @e[tag=rit_trap_spawn] run summon minecraft:armor_stand ~1 ~ ~ {PortalCooldown:8,Marker:1b,Invisible:1b,Tags:["rit_trap_spawn"]}
execute at @e[tag=rit_trap_spawn] run summon minecraft:armor_stand ~2 ~ ~ {PortalCooldown:8,Marker:1b,Invisible:1b,Tags:["rit_trap_spawn"]}
execute at @e[tag=rit_trap_spawn] run summon minecraft:armor_stand ~4 ~ ~ {PortalCooldown:8,Marker:1b,Invisible:1b,Tags:["rit_trap_spawn"]}
execute at @e[tag=rit_trap_spawn] run summon minecraft:armor_stand ~ ~ ~1 {PortalCooldown:8,Marker:1b,Invisible:1b,Tags:["rit_trap_spawn"]}
execute at @e[tag=rit_trap_spawn] run summon minecraft:armor_stand ~ ~ ~2 {PortalCooldown:8,Marker:1b,Invisible:1b,Tags:["rit_trap_spawn"]}
execute at @e[tag=rit_trap_spawn] run summon minecraft:armor_stand ~ ~ ~4 {PortalCooldown:8,Marker:1b,Invisible:1b,Tags:["rit_trap_spawn"]}

execute as @e[tag=rit_trap_spawn] run data modify entity @s ArmorItems set value [{id:"minecraft:player_head",Count:1b},{},{},{}]
execute as @e[tag=rit_trap_spawn] at @s run data modify entity @s ArmorItems[0].tag.SkullOwner.Id set from entity @p[tag=rit_trap_placed] UUID
execute as @a[tag=rit_trap_placed] run tag @s remove rit_trap_placed

execute as @e[tag=rit_trap_spawn] run tag @s add rit_trap_checker
execute as @e[tag=rit_trap_spawn] run tag @s remove rit_trap_spawn

execute as @e[tag=rit_trap_checker,nbt={PortalCooldown:0}] run kill

execute as @e[tag=rit_trap_checker] at @s if block ~.5 ~ ~.5 minecraft:obsidian if block ~-.5 ~ ~-.5 minecraft:obsidian if block ~-.5 ~ ~.5 minecraft:crying_obsidian if block ~.5 ~ ~-.5 minecraft:crying_obsidian unless entity @e[tag=rit_trap_active,distance=..0.001] run summon minecraft:armor_stand ~ ~ ~ {Marker:1b,Invisible:1b,Tags:["rit_trap_active"]}
execute as @e[tag=rit_trap_checker] at @s if block ~.5 ~ ~.5 minecraft:crying_obsidian if block ~-.5 ~ ~-.5 minecraft:crying_obsidian if block ~-.5 ~ ~.5 minecraft:obsidian if block ~.5 ~ ~-.5 minecraft:obsidian unless entity @e[tag=rit_trap_active,distance=..0.001] run summon minecraft:armor_stand ~ ~ ~ {Marker:1b,Invisible:1b,Tags:["rit_trap_active"]}
execute as @e[tag=rit_trap_checker] at @s run tp ~ ~1 ~

execute as @e[tag=rit_trap_active,nbt=!{ArmorItems:[{id:"minecraft:player_head"}]}] run scoreboard players set @s lives 0
execute as @e[tag=rit_trap_active,nbt=!{ArmorItems:[{id:"minecraft:player_head"}]}] run data modify entity @s ArmorItems set from entity @e[tag=rit_trap_checker,limit=1,sort=nearest] ArmorItems

# execute at @a[scores={mined_obsidian=1..}] as @e[tag=rit_trap_active,distance=..6] run tag @s add rit_trap_destroy
# execute at @a[scores={mined_crying=1..}] as @e[tag=rit_trap_active,distance=..6] run tag @s add rit_trap_destroy

execute at @a as @e[tag=rit_trap_active,distance=..6] run tag @s add rit_trap_destroy
execute as @e[tag=rit_trap_destroy] at @s if block ~.5 ~ ~.5 minecraft:obsidian if block ~-.5 ~ ~-.5 minecraft:obsidian if block ~-.5 ~ ~.5 minecraft:crying_obsidian if block ~.5 ~ ~-.5 minecraft:crying_obsidian run tag @s remove rit_trap_destroy
execute as @e[tag=rit_trap_destroy] at @s if block ~.5 ~ ~.5 minecraft:crying_obsidian if block ~-.5 ~ ~-.5 minecraft:crying_obsidian if block ~-.5 ~ ~.5 minecraft:obsidian if block ~.5 ~ ~-.5 minecraft:obsidian run tag @s remove rit_trap_destroy

execute as @e[tag=rit_trap_destroy] if score @s lives matches 1.. run tag @s add rit_trap_retain
execute as @e[tag=rit_trap_retain] run tag @s remove rit_trap_destroy
execute as @e[tag=rit_trap_retain] run tag @s remove rit_trap_active

kill @e[tag=rit_trap_destroy]
kill @e[tag=rit_trap_retain,scores={lives=..0}]


execute store result score time random run time query gametime
execute as @e[tag=rit_trap_active] store result score @s random run data get entity @e[sort=random,limit=1] UUID[0]
execute as @e[tag=rit_trap_active] run scoreboard players operation @s random += time random
execute as @e[tag=rit_trap_active] run scoreboard players operation @s random %= mod random
execute as @e[tag=rit_trap_active] at @s if score @s random matches 0 run particle minecraft:soul_fire_flame ~ ~1.2 ~ 0.5 2.0 0.5 0 1

scoreboard players set @a placed_obsidian 0
scoreboard players set @a placed_crying 0
# scoreboard players set @a mined_obsidian 0
# scoreboard players set @a mined_crying 0

# execute at @e[type=armor_stand,tag=te] if block ~.5 ~ ~.5 minecraft:crying_obsidian if block ~-.5 ~ ~-.5 minecraft:crying_obsidian if block ~-.5 ~ ~.5 minecraft:obsidian if block ~.5 ~ ~-.5 minecraft:obsidian run


# Trap AOE Ritual
# execute at @e[type=item,nbt={Item:{id:"minecraft:grass_block"}}] run particle soul_fire_flame ~ ~ ~ 100 10 100 0.005 600




# Golden Pressure Plate Inventory Checker

execute as @a[nbt={Inventory:[]}] at @s if block ~ ~ ~ minecraft:light_weighted_pressure_plate run particle minecraft:glow ~ ~1 ~ 0.2 0.5 0.2 0.0 1
