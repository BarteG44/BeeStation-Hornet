/obj/effect/forcefield
	desc = "A space wizard's magic wall."
	name = "FORCEWALL"
	icon_state = "m_shield"
	anchored = TRUE
	opacity = FALSE
	density = TRUE
	CanAtmosPass = ATMOS_PASS_DENSITY
	z_flags = Z_BLOCK_IN_DOWN | Z_BLOCK_IN_UP
	var/timeleft = 300 //Set to 0 for permanent forcefields (ugh)

CREATION_TEST_IGNORE_SUBTYPES(/obj/effect/forcefield)

/obj/effect/forcefield/Initialize(mapload, ntimeleft)
	. = ..()
	if(isnum_safe(ntimeleft))
		timeleft = ntimeleft
	if(timeleft)
		QDEL_IN(src, timeleft)

/obj/effect/forcefield/singularity_pull()
	return

/obj/effect/forcefield/cult
	desc = "An unholy shield that blocks all attacks."
	name = "glowing wall"
	icon = 'icons/effects/cult_effects.dmi'
	icon_state = "cultshield"
	CanAtmosPass = ATMOS_PASS_NO
	timeleft = 200

///////////Mimewalls///////////

/obj/effect/forcefield/mime
	icon_state = "nothing"
	name = "invisible wall"
	desc = "You have a bad feeling about this."

/obj/effect/forcefield/mime/advanced
	name = "invisible blockade"
	desc = "You're gonna be here awhile."
	timeleft = 600

CREATION_TEST_IGNORE_SUBTYPES(/obj/effect/forcefield/mime)

/obj/effect/forcefield/mime/Initialize(mapload, ntimeleft)
	. = ..()
	SSvis_overlays.add_obj_alpha(src, 'icons/turf/walls/snow_wall.dmi', "snow_wall-0")
