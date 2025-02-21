/datum/uplink_item/item/badassery/bioterror
	name = "Bioterror Kit"
	desc = "Kit, filled with bioweaponery. It contains: Voidsuit, sprayer with bioterror mix, bioterror grenade and military pistol. Don't forget to turn your internals on!"
	item_cost = DEFAULT_TELECRYSTAL_AMOUNT
	antag_roles = list(MODE_MERCENARY)
	path = /obj/item/storage/backpack/dufflebag/syndie_kit/bioterror

/datum/uplink_item/item/badassery/pyro
	name = "Pyro Kit"
	desc = "Kit, used for making FIRES! It contains: Special pyro voidsuit, flamethrower with 2 phoron tanks, 2 incendiary grenades and military pistol."
	item_cost = DEFAULT_TELECRYSTAL_AMOUNT
	antag_roles = list(MODE_MERCENARY)
	path = /obj/item/storage/backpack/dufflebag/syndie_kit/pyro

/datum/uplink_item/item/badassery/classic
	name = "Classic Kit"
	desc = "Old and faithful kit. It contains: Heavy armor, assault rifle, cryptographic sequencer and grenade."
	item_cost = DEFAULT_TELECRYSTAL_AMOUNT
	antag_roles = list(MODE_MERCENARY)
	path = /obj/item/storage/backpack/dufflebag/syndie_kit/classic

/datum/uplink_item/item/badassery/stealthy
	name = "Stealthy Kit"
	desc = "A special kit for stealthy operations. It contains: Chameleon kit, fake crew annoncement, freedom implant, cryptographic sequencer, military pistol and clerical kit."
	item_cost = DEFAULT_TELECRYSTAL_AMOUNT
	antag_roles = list(MODE_MERCENARY)
	path = /obj/item/storage/backpack/dufflebag/syndie_kit/stealthy

/datum/uplink_item/item/badassery/sniper
	name = "Sniper Kit"
	desc = "Fashionable kit for fashionable operatives. It contains: Cool-looking armor vest, disguised as a suit, thermal googles and sniper rifle with ammo."
	item_cost = DEFAULT_TELECRYSTAL_AMOUNT
	antag_roles = list(MODE_MERCENARY)
	path = /obj/item/storage/backpack/dufflebag/syndie_kit/sniper

/datum/uplink_item/item/badassery/spaceass
	name = "Space Assault Kit"
	desc = "Buy this kit if you want to raid the ship from the space. It contains: Voidsuit, X-4 explosive, assault rifle and cryptographic sequencer."
	item_cost = DEFAULT_TELECRYSTAL_AMOUNT
	antag_roles = list(MODE_MERCENARY)
	path = /obj/item/storage/backpack/dufflebag/syndie_kit/spaceass

/datum/uplink_item/item/badassery/saboteur
	name = "Saboteur Kit"
	desc = "You want to sabotage ship systems? This kit is specially for you. It contains: Heavy armor, military pistol, flashdark, chameleon projector, cryptographic sequencer and some C-4 explosives."
	item_cost = DEFAULT_TELECRYSTAL_AMOUNT
	antag_roles = list(MODE_MERCENARY)
	path = /obj/item/storage/backpack/dufflebag/syndie_kit/saboteur

/datum/uplink_item/item/badassery/medic
	name = "Field Medic Kit"
	desc = "This kit can provide almost everything for combat medic. It contains: Heavy armor, military pistol, combat medkit, combat defibrilator and surgery kit."
	item_cost = DEFAULT_TELECRYSTAL_AMOUNT
	antag_roles = list(MODE_MERCENARY)
	path = /obj/item/storage/backpack/dufflebag/syndie_kit/medic

/datum/uplink_item/item/badassery/heavy
	name = "Heavy Kit"
	desc = "This kit is for heavy gunners. It contains: Heavy armor, energy shield, grenade and L6 Saw machinegun."
	item_cost = DEFAULT_TELECRYSTAL_AMOUNT * 2
	antag_roles = list(MODE_MERCENARY)
	path = /obj/item/storage/backpack/dufflebag/syndie_kit/heavy

/datum/uplink_item/item/badassery/mech
	name = "Combat Mech"
	var/static/BOUGHT_MECH = 0
	desc = "A terrible and at the same time beautiful combat mech to destroy all living things in your way. Comes with special plasma rifle, machinegun and shielding drone. Also, it is almoust EMP-proof!"
	item_cost = 400
	antag_roles = list(MODE_MERCENARY)

/datum/uplink_item/item/badassery/mech/get_goods(var/obj/item/device/uplink/U, var/loc)
	if(!GLOB.war_declared)
		U.visible_message("[U.loc] Война не обьявлена, бронетехника не может быть вызвана. Обьявите войну для получения доступа к бронетехнике.\"")
		return new /obj/item/stack/telecrystal(loc, 400)
	if(GLOB.max_mech <= 0)
		U.visible_message("[U.loc] Превышен лимит бронетехники для данной миссии.\"")
		return new /obj/item/stack/telecrystal(loc, 400)
	GLOB.max_mech--
	U.visible_message("[U.loc] Запрос на бронетехнику Горлекса обработан, единица телепортирована на ваше местоположение.\"")
	command_announcement.Announce("В секторе была замечена телепортация бронетехники Мародёров Горлекса.", "Показания датчиков [station_name()]" , msg_sanitized = 1, zlevels = GLOB.using_map.station_levels)
	return new /mob/living/exosuit/premade/merc(loc)

/datum/uplink_item/item/badassery/tobacco
	name = "Strong tobacco"
	desc = "A very strong tobacco for cool agents! The filter and paper for cigarettes are not included in the package."
	item_cost = 4
	path = /obj/item/tobacco/strong
