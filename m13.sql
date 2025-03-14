SELECT 
	gaia_source.source_id,
	gaia_source.ra,
	gaia_source.dec,
	gaia_source.parallax,
	gaia_source.parallax_error,
	gaia_source.phot_g_mean_mag,
	gaia_source.bp_rp,

	DISTANCE(
		POINT(
			'ICRS', 
			gaiadr3.gaia_source.ra,
			gaiadr3.gaia_source.dec
		), 
		POINT('ICRS',
			COORD1(EPOCH_PROP_POS(250.42347500000002, 36.46131944, .1270, -3.1800, -2.5600, -244.4000, 2000, 2016.0)),
			COORD2(EPOCH_PROP_POS(250.42347500000002, 36.46131944, .1270, -3.1800, -2.5600, -244.4000, 2000, 2016.0))
		)
	) AS "target_separation"

FROM gaiadr3.gaia_source 
WHERE 
	CONTAINS(
		POINT(
			'ICRS',
			gaiadr3.gaia_source.ra,
			gaiadr3.gaia_source.dec
		),
		CIRCLE(
			'ICRS',
			COORD1(EPOCH_PROP_POS(250.42347500000002,36.46131944,.1270,-3.1800,-2.5600,-244.4000,2000,2016.0)),
			COORD2(EPOCH_PROP_POS(250.42347500000002,36.46131944,.1270,-3.1800,-2.5600,-244.4000,2000,2016.0)),
			1
		)
	)=1