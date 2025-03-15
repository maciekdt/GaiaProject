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
			COORD1(EPOCH_PROP_POS(245.89675000000003,-26.52575,.5560,-12.4800,-18.9900,71.0000,2000,2016.0)),
			COORD2(EPOCH_PROP_POS(245.89675000000003,-26.52575,.5560,-12.4800,-18.9900,71.0000,2000,2016.0))
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
			COORD1(EPOCH_PROP_POS(245.89675000000003,-26.52575,.5560,-12.4800,-18.9900,71.0000,2000,2016.0)),
			COORD2(EPOCH_PROP_POS(245.89675000000003,-26.52575,.5560,-12.4800,-18.9900,71.0000,2000,2016.0)),
			1
		)
	)=1