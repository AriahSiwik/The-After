tag @s add spire_summoned

summon wither_skeleton ~ ~ ~ {DeathLootTable:"after:kelp",CanPickUpLoot:0b,Health:100f,Tags:["spire_boss","boss_illusion"],HandItems:[{},{id:"minecraft:bow",Count:1b}],ArmorItems:[{id:"minecraft:netherite_boots",Count:1b},{id:"minecraft:netherite_leggings",Count:1b},{id:"minecraft:netherite_chestplate",Count:1b},{id:"minecraft:player_head",Count:1b,tag:{SkullOwner:{Id:[I;-1817232299,-419214159,-1937406914,1384324274],Properties:{textures:[{Value:"eyJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvYTAwNmIxYWZiZDdlZmM4ODUwZGFjOTY5NDU5YjA4NmFmYTI1MDNiYmYwMzE3NjRiODhiOTgzMTc0MGMwNzg5MyJ9fX0="}]}}}}],ArmorDropChances:[0.000F,0.000F,0.000F,0.000F],HandDropChances:[0.000F,0.000F],Attributes:[{Name:"generic.max_health",Base:100},{Name:"generic.knockback_resistance",Base:0.4},{Name:"generic.movement_speed",Base:0.13},{Name:"generic.attack_damage",Base:0}]}
bossbar add after:boss_illusion {"text":"Illusion Boss"}
bossbar set after:boss_illusion color purple
bossbar set after:boss_illusion style notched_10
bossbar set after:boss_illusion max 100
bossbar set after:boss_illusion visible true


execute as @e[tag=boss_illusion] run scoreboard players set @s timer 0