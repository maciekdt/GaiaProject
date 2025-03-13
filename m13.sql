SELECT TOP 10000 gaia_source.designation,gaia_source.source_id,gaia_source.ra,gaia_source.dec,gaia_source.parallax,gaia_source.pmra,gaia_source.pmdec,gaia_source.ruwe,gaia_source.phot_g_mean_mag,gaia_source.bp_rp,gaia_source.radial_velocity,gaia_source.phot_variable_flag,gaia_source.non_single_star,gaia_source.has_xp_continuous,gaia_source.has_xp_sampled,gaia_source.has_rvs,gaia_source.has_epoch_photometry,gaia_source.has_epoch_rv,gaia_source.has_mcmc_gspphot,gaia_source.has_mcmc_msc,gaia_source.teff_gspphot,gaia_source.logg_gspphot,gaia_source.mh_gspphot,gaia_source.distance_gspphot,gaia_source.azero_gspphot,gaia_source.ag_gspphot,gaia_source.ebpminrp_gspphot,'m13' AS target_id,250.42347500000002 AS target_ra,36.4613194 AS target_dec,.1270 AS target_parallax,-3.1800 AS target_pm_ra,-2.5600 AS target_pm_dec,-244.4000 AS target_radial_velocity,2000 AS epoch,
DISTANCE(POINT('ICRS' , gaiadr3.gaia_source.ra, gaiadr3.gaia_source.dec), 
POINT('ICRS',
				COORD1(EPOCH_PROP_POS(250.42347500000002, 36.4613194, .1270, -3.1800, -2.5600, -244.4000, 2000, 2016.0)),
				COORD2(EPOCH_PROP_POS(250.42347500000002, 36.4613194, .1270, -3.1800, -2.5600, -244.4000, 2000, 2016.0)))) AS "target_separation (deg)"
FROM gaiadr3.gaia_source 
WHERE 
CONTAINS(
	POINT('ICRS',gaiadr3.gaia_source.ra,gaiadr3.gaia_source.dec),
	CIRCLE(
		'ICRS',
		COORD1(EPOCH_PROP_POS(250.42347500000002,36.4613194,.1270,-3.1800,-2.5600,-244.4000,2000,2016.0)),
		COORD2(EPOCH_PROP_POS(250.42347500000002,36.4613194,.1270,-3.1800,-2.5600,-244.4000,2000,2016.0)),
		0.3333333333333333)
)=1 ORDER BY target_id, "target_separation (deg)"