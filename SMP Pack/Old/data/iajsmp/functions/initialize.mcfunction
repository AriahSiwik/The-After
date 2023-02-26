scoreboard objectives add non_pvp_deaths deathCount

scoreboard objectives add pvp_deaths minecraft.killed_by:minecraft.player

scoreboard objectives add kills playerKillCount

scoreboard objectives add lives dummy "Lives"

scoreboard objectives setdisplay list lives



scoreboard players set @a non_pvp_deaths 0

scoreboard players set @a pvp_deaths 0

scoreboard players set @a kills 0

scoreboard players set @a lives 10



scoreboard objectives add rit_com_complete trigger

scoreboard objectives add rit_com_reject trigger



scoreboard players set @a rit_com_complete 0

scoreboard players set @a rit_com_reject 0



scoreboard objectives add placed_obsidian minecraft.used:minecraft.obsidian

scoreboard objectives add placed_crying minecraft.used:minecraft.crying_obsidian

# scoreboard objectives add mined_obsidian minecraft.mined:minecraft.obsidian

# scoreboard objectives add mined_crying minecraft.mined:minecraft.crying_obsidian



scoreboard players set @a placed_obsidian 0

scoreboard players set @a placed_crying 0

# scoreboard players set @a mined_obsidian 0

# scoreboard players set @a mined_crying 0



scoreboard objectives add random dummy

scoreboard players set mod random 15



scoreboard objectives add afk.time dummy

scoreboard objectives add afk.p0 dummy

scoreboard objectives add afk.y0 dummy

scoreboard objectives add afk.p1 dummy

scoreboard objectives add afk.y1 dummy



scoreboard players set @a afk.time 0



team add afk

team modify afk color gray

team empty afk



# schedule function iajsmp:website 5s