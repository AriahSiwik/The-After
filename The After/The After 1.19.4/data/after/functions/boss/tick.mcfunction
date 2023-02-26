tag @a remove boss_illusion_bar
execute at @e[tag=boss_illusion] as @a[distance=..64] run tag @s add boss_illusion_bar
bossbar set after:boss_illusion players @a[tag=boss_illusion_bar]
execute as @e[tag=boss_illusion] at @s run function after:boss/illusion/tick