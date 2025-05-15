author "Debux Workshop"
description 'debux.tebex.io'

fx_version 'cerulean'
game 'gta5'
files {
	'common/**/carcols.meta',
	'common/**/carvariations.meta',
	'common/**/dlctext.meta',
	'common/**/handling.meta',
	'common/**/vehicles.meta',
	'common/**/*.meta'
}
data_file 'DLCTEXT_FILE' 'common/**/dlctext.meta'
data_file 'HANDLING_FILE' 'common/**/handling.meta'
data_file 'VEHICLE_METADATA_FILE' 'common/**/vehicles.meta'
data_file 'CARCOLS_FILE' 'common/carcols.meta'
data_file 'VEHICLE_VARIATION_FILE' 'common/**/carvariations.meta'
data_file "DLC_ITYP_REQUEST" "rl_top_new.ytyp"

lua54 'yes'

-- escrow_ignore {
-- 	'common/**/*',
-- 	'stream/**/*',
-- 	'*.ytyp',
-- 	'*.meta',
-- 	'*.ytd',
-- 	'*.ydr',
-- 	'*.ymf',
-- 	'*.ymap',
-- 	'*.yft',
-- 	'*.ybn',
-- 	'*.ydd',
-- 	'*.ycd',
-- 	'**/data/**/*'
-- }
dependency '/assetpacks'