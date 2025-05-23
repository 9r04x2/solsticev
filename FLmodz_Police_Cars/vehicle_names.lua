function AddTextEntry(key, value)
	Citizen.InvokeNative(GetHashKey("ADD_TEXT_ENTRY"), key, value)
end

Citizen.CreateThread(function()

	AddTextEntry('0x211B70DA', 'Centurion')
    AddTextEntry('0x0C480F9A', 'Door-mounted Wingmirrors')
    AddTextEntry('0x1A0DAB25', 'Alternate Wingmirrors')
    AddTextEntry('0x1D653D93', 'Door Stops')
    AddTextEntry('0x3E118E48', 'Additional Marker Lights')
    AddTextEntry('0x4D3913A9', 'Mounted Static Ram Bar')
    AddTextEntry('0x5D8FC9DE', 'No Headlight Cover')
    AddTextEntry('0x9D9BED6B', 'LED Takedowns')
    AddTextEntry('0x42F7B65F', 'Mounted LED Takedown')
    AddTextEntry('0x538AB0FC', 'Mounted Hydaulic Ram Bar')
    AddTextEntry('0x786C9C52', 'Vertical Screen Guards')
    AddTextEntry('0x847E5E3B', 'Painted Running Board')
    AddTextEntry('0x1604ED75', 'Plastic Running Board')
    AddTextEntry('0x6268CEB8', 'Hydaulic Ram Bar')
    AddTextEntry('0x8592B69E', 'Window Screen Guards')
    AddTextEntry('0x11011A1F', 'Bumper Guides')
    AddTextEntry('0xA78AC84B', 'Static Ram Bar')
    AddTextEntry('0xA7047981', 'Horizontal Screen Guards')
    AddTextEntry('0xD004BF96', 'Alternate Diagonal Headlight Cover')
    AddTextEntry('0xF344F546', 'Diagonal Headlight Cover')

	
	--Generic Liveries
	--CVPI/Police Generic
	AddTextEntry('RETIN_LIV9','West Bromwich Constabulary')
	AddTextEntry('0xD0A61B6B','San Andreas Pursuit Interceptors')
	AddTextEntry('0xF792CF90','Roll Cage')
	AddTextEntry('0xAF357E34','Roll Cage & Rifle Rack')
	AddTextEntry('0x7CC58E60','State Range Antenna')
	AddTextEntry('0xF58E4969','Widebar Rambar')
	AddTextEntry('0x1224EA34','Slicktop')
	AddTextEntry('NPOL_SLICK2','Slicktop')
	AddTextEntry('0xFECF3A9D','ALPR Kameralı Tepe Lambası')
	AddTextEntry('NPOL_ALPR2','ALPR Cameras & Aero Package')
	AddTextEntry('NPOL_LIVSTATE','San Andreas State Trooper')
	AddTextEntry('0x5A48C963','LSPD City Range')
	AddTextEntry('0x680EE4EF','BCSO County Range')
	AddTextEntry('0x9F06D2E2','SASP State Range')
	AddTextEntry('0x2D6614AF','MDT, Radio & Wisen Siren Controller')
	AddTextEntry('0x27A45995','Dash Radar')
	AddTextEntry('0xEBBF35CB','LSPD Ram Bar')
	AddTextEntry('0xD8F39034','BCSO Bullbar')
	AddTextEntry('0x0852EEF2','SASP/Ranger Wrap-Around Bullbar')
	AddTextEntry('0xD39C39E7','Kanıt Çantası')
	AddTextEntry('0x288EE3C7','Yangın Söndürme Tüpü')
	AddTextEntry('0x1A50474A','Cases & Extinguisher')
	AddTextEntry('0xF5DF543C','Divider')
	AddTextEntry('0xFFAD955D','Divider & Gunrack')
	AddTextEntry('0x7CEDE162','Reading Light')
	AddTextEntry('0xF512A148','Add Rear Seats/Remove K9 Cage')
	AddTextEntry('0x1C7478CB','0')
	AddTextEntry('0x2E4D1C7C','1')
	AddTextEntry('0xB18F2302','2')
	AddTextEntry('0xC06EC0C1','3')
	AddTextEntry('0xD54CEA7D','4')
	AddTextEntry('0xE8038FEA','5')
	AddTextEntry('0xA39B0722','6')
	AddTextEntry('0xB4DA29A0','7')
	AddTextEntry('0xC7BCCF65','8')
	AddTextEntry('0xD956F299','9')
	AddTextEntry('0x2F618B3A','Los Santos Police Department V2')
	AddTextEntry('NPOL_LIV57','Los Santos Police Department')
	AddTextEntry('NPOL_LIV58','Los Santos Police Department K9')
	AddTextEntry('0xCD32C6DA','Los Santos Police Department K9 V2')
	AddTextEntry('0xDAC66201','San Andreas Park Rangers')
	AddTextEntry('0x28C1FDFB','San Andreas Park Rangers K9')
	AddTextEntry('0xF64A190C','San Andreas Highway Patrol')
	AddTextEntry('0xB8A21DB5','San Andreas Highway Patrol K9')
	AddTextEntry('0xC67AB966','Department of Corrections')
	AddTextEntry('0xD420D4B2','San Andreas Park Rangers')
	AddTextEntry('0xE1D6701D','San Andreas Park Rangers K9')
	AddTextEntry('0x9A8132FD','Unmarked/Decommissioned')
	AddTextEntry('0x8C229640','San Andreas State Police V2')
	AddTextEntry('0x75BC6974','San Andreas State Police K9 V2')
	AddTextEntry('0x6676CAE9','Los Santos Police Department V2')
	AddTextEntry('0x306FDEDC','Los Santos Police Department K9 V2')
	AddTextEntry('NPOL_LIV17','BCSO Ghost (HC Only)')
	AddTextEntry('NPOL_LIV18','LSPD Ghost (HC Only)')
	AddTextEntry('NPOL_LIV55',"Los Santos Sheriff's County-K9")
	AddTextEntry('NPOL_LIV56',"Los Santos Sheriff's County")
	AddTextEntry('NPOL_LIV95',"Gang Unit Task Force")
	AddTextEntry('NPOL_C0_DEP','0 - Patrol')
	AddTextEntry('NPOL_C1_DEP','1 - SCU')
	AddTextEntry('NPOL_C2_DEP','2 - HVTU')
	AddTextEntry('NPOL_C3_DEP','3 - Park Rangers')
	AddTextEntry('NPOL_C4_DEP','4 - S.W.A.T.')
	AddTextEntry('NPOL_C5_DEP','5 - SRU')
	AddTextEntry('NPOL_C6_DEP','6 - BTF')
	AddTextEntry('NPOL_C7_DEP','7')
	AddTextEntry('NPOL_C8_DEP','8')
	AddTextEntry('NPOL_C9_DEP','9')
	AddTextEntry('NPOL_C0_RANK','0 - Cadet')
	AddTextEntry('NPOL_C1_RANK','1 - Solo Cadet')
	AddTextEntry('NPOL_C2_RANK','2 - Officer / Deputy')
	AddTextEntry('NPOL_C3_RANK','3 - Sr Officer / Deputy')
	AddTextEntry('NPOL_C4_RANK','4 - Corporal')
	AddTextEntry('NPOL_C5_RANK','5 - Sergeant')
	AddTextEntry('NPOL_C6_RANK','6 - Lieutenant')
	AddTextEntry('NPOL_C7_RANK','7 - Captain')
	AddTextEntry('NPOL_C8_RANK','8 - Ass. Chief / Undersheriff ')
	AddTextEntry('NPOL_C9_RANK','9 - Chief of Police / Sheriff')
	AddTextEntry('NPOL_TAG_S','Supervisor')
	AddTextEntry('NPOL_TAG_C','Command')
	--Police Flags
	AddTextEntry("FLAG_001", "United States of America")
	AddTextEntry("FLAG_002", "Australia")
	AddTextEntry("FLAG_003", "Brazil")
	AddTextEntry("FLAG_004", "Spain")
	AddTextEntry("FLAG_005", "Canada")
	AddTextEntry("FLAG_006", "United Kingdom")
	AddTextEntry("FLAG_007", "Scotland")
	AddTextEntry("FLAG_008", "Japan")
	AddTextEntry("FLAG_009", "Germany")
	AddTextEntry("FLAG_010", "France")
	AddTextEntry("FLAG_011", "Italy")
	AddTextEntry("FLAG_012", "Switzerland")
	AddTextEntry("FLAG_013", "Jamaica")
	AddTextEntry("FLAG_014", "Colombia")
	AddTextEntry("FLAG_015", "Norway")
	AddTextEntry("FLAG_016", "Russia")
	AddTextEntry("FLAG_017", "South Africa")
	AddTextEntry("FLAG_018", "Mexico")
	AddTextEntry("FLAG_019", "Belgium")
	AddTextEntry("FLAG_020", "Sweden")
	AddTextEntry("FLAG_021", "Argentina")
	AddTextEntry("FLAG_022", "Turkey")
	AddTextEntry("FLAG_023", "Ireland")
	AddTextEntry("FLAG_024", "Wales")
	AddTextEntry("FLAG_025", "England")
	--Police Stickers
	AddTextEntry("STICKER_SAPR", "Park Rangers")
	AddTextEntry("STICKER_K9", "K9")
	AddTextEntry("STICKER_SPONS_1", "NP Cards")
	AddTextEntry("STICKER_202", "A_202")
	AddTextEntry("STICKER_238", "A_238")
	AddTextEntry("STICKER_255", "A_255")
	AddTextEntry("STICKER_331", "A_331")
	AddTextEntry("STICKER_337", "A_337")
	AddTextEntry("STICKER_355", "A_355")
	AddTextEntry("STICKER_397", "A_397")
	AddTextEntry("STICKER_402", "A_402")
	AddTextEntry("STICKER_423", "A_423")
	AddTextEntry("STICKER_455", "A_455")
	AddTextEntry("STICKER_460", "A_460")
	AddTextEntry("STICKER_469", "A_469")
	AddTextEntry("STICKER_485", "A_485")
	AddTextEntry("STICKER_B_215", "B_215")
	AddTextEntry("STICKER_B_270", "B_270")
	AddTextEntry("STICKER_B_319", "B_319")
	AddTextEntry("STICKER_B_385", "B_385")
	AddTextEntry("STICKER_B_431", "B_431")
	AddTextEntry("STICKER_B_447", "B_447")
	AddTextEntry("STICKER_B_451", "B_451")
	AddTextEntry("STICKER_B_484", "B_484")
	AddTextEntry("STICKER_B_490", "B_490")
	AddTextEntry("STICKER_C_300", "C_300")
	AddTextEntry("STICKER_C_304", "C_304")
	AddTextEntry("STICKER_C_338", "C_338")
	AddTextEntry("STICKER_C_365", "C_365")
	AddTextEntry("STICKER_C_382", "C_382")
	AddTextEntry("STICKER_C_492", "C_492")
	--Charger
	AddTextEntry("NPOLCHAR_BBAR_1", "Pit Demiri")
	AddTextEntry("NPOLCHAR_BBAR_2", "Pit Demiri (Hellcat paket)")
	AddTextEntry("NPOL_CHAR_CONVER", "Hellcat Paket")

    -- POLICE DEPARTMENTS
	AddTextEntry('LOGHARR_LSPD','Los Santos Police Department')
	AddTextEntry('LOGHARR_LSPDK9','Los Santos Police Department K9')
	AddTextEntry('LOGHARR_LSPD2','Los Santos Police Department V2')
	AddTextEntry('LOGHARR_LSPD2K9','Los Santos Police Department V2 K9')
	AddTextEntry('LOGHARR_LSPD3','Los Santos Police Department V3')
	AddTextEntry('LOGHARR_LSPD3K9','Los Santos Police Department V3 K9')
	AddTextEntry('LOGHARR_LSPD4','Los Santos Police Department V4')
	AddTextEntry('LOGHARR_LSPD4K9','Los Santos Police Department V4 K9')
	AddTextEntry('LOGHARR_VPD','Vinewood Police Department')
	AddTextEntry('LOGHARR_VPDK9','Vinewood Police Department K-9')
	AddTextEntry('LOGHARR_PDG','PD GHOST')

	-- SHERIFF DEPARTMENTS
	AddTextEntry('LOGHARR_SHERIFF','Blaine County Sheriff Office (BCSO)')
	AddTextEntry('LOGHARR_PBSD','Paleto Bay Sheriff Department')
	AddTextEntry('LOGHARR_PBSDK9','Paleto Bay Sheriff Department K9')
	AddTextEntry('LOGHARR_SHERIFFK9','Blaine County Sheriff Office K9 (BCSO)')
	AddTextEntry('LOGHARR_SHERIFF2','Los Santos Sheriff Department V2')
	AddTextEntry('LOGHARR_SHERIFF2K9','Los Santos Sheriff Department V2 K9')
	AddTextEntry("LOGHARR_DAVIS", "Davis Sheriff Department")
	AddTextEntry('LOGHARR_SDG','SD GHOST')
		AddTextEntry('LOGHARR_LSPDN', 'Los Santos Police Department V3')

	-- STATE DEPARTMENTS
	AddTextEntry('LOGHARR_SASP','San Andreas State Polıce (SASP)')
	AddTextEntry('LOGHARR_PINTERCEPTOR','State Police Pursuit Interceptor')
	AddTextEntry('LOGHARR_SAST','San Andreas State Police (SASP)')
	AddTextEntry('LOGHARR_SASTK9','San Andreas State Police K-9 (SASP)')
	AddTextEntry('LOGHARR_SAHP','San Andreas Highway Patrol (SAHP)')
	AddTextEntry('LOGHARR_SAHPK9','San Andreas Highway Patrol K9 (SAHP)')
	AddTextEntry('LOGHARR_PRANGER','San Andreas Park Rangers')
	AddTextEntry('LOGHARR_PRANGERK9','San Andreas Park Rangers K-9')
	AddTextEntry('LOGHARR_BCSON','Blaine County Sheriff Office (BCSO) V2')

	-- SDSO
	AddTextEntry('MAROON_SDSOMAROON','Senora Desert Sheriff Office (SDSO)')
	AddTextEntry('MAROON_BCSOMAROON','Blaine County Sheriff Office (BCSO)')
	AddTextEntry('MAROON_MRPDMAROON','Mission Row Police Department (MRPD)')
	AddTextEntry('MAROON_SAPRMAROON','San Andreas Park Ranger (SAPR)')
	AddTextEntry('MAROON_PALETOMAROON','Paleto Bay Sheriff Office (PBSO)')
	-- Npoltahoe
	AddTextEntry('LOGHARR_PALETOMAROON','Paleto Bay Sheriff Office (PBSO)')
	AddTextEntry('LOGHARR_SAPRMAROON','San Andreas Park Ranger (SAPR)')
	AddTextEntry('LOGHARR_MRPDMAROON','Mission Row Police Department (MRPD)')
	AddTextEntry('LOGHARR_BCSOMAROON','Blaine County Sheriff Office (BCSO)')
	AddTextEntry('CLRGTAHOE_LIV5','San Andreas State Police (SASP)')
	AddTextEntry('CLRGTAHOE_LIV6','San Andreas State Police K-9 (SASP)')
	
	
	
	-- OTHER 
	AddTextEntry('LOGHARR_GUNIT','Gang Unit')
	AddTextEntry('LOGHARR_FIB','FIB')

	AddTextEntry('LOGHARR_EMS','Emergency Medical Services (EMS)')

	AddTextEntry("NPOLCHAR_LIV_SASP2", "Harmony Sheriff Department")
	AddTextEntry("NPOLCHAR_LIV75", "Paleto Bay Sheriff Department")
	AddTextEntry("NPOL_SLICK3", "Tepe Lambasını Kaldır")
	AddTextEntry("NPOL_SLICK4", "Performans Paket")
	AddTextEntry("NPOLCHAR_SPL0", "SRT Spoiler")
	AddTextEntry("NPOLCHAR_SPL1", "Hellcat Spoiler")
	--Explorer
	AddTextEntry("NPOLEXP_ANT1", "LSPD Şehir içi Anteni")
	AddTextEntry("NPOLEXP_ANT2", "Eyalet & Kasaba Anteni")
	AddTextEntry("NPOLEXP_BBAR_1", "Pit Demiri")
	-- Generic Spoiler
	AddTextEntry("NULL_SPOILER", "Aero Package")
	AddTextEntry("NULL_WINGLESS", "Aero Package & Wingless")
	--Cullinan
	AddTextEntry("NPCUL", "Cullinan")
	AddTextEntry("RROYCE", "Rolls Royce")
	AddTextEntry("NPCUL_EMB1", "Black Ornament")
	AddTextEntry("NPCUL_TBLACK_BUMF", "Front Bumper Dechrome")
	AddTextEntry("NPCUL_TBLACK_BUMR", "Rear Bumper Dechrome")
	AddTextEntry("NPCUL_TRIM_BLACK", "Bodyshell Dechrome")
	AddTextEntry("NPCUL_LIGHT_BLACK", "Light Dechrome")
	AddTextEntry("NPCUL_EURO", "Euro Style Plate")
	AddTextEntry("NPCUL_MIRR", "Black Mirrors")
	AddTextEntry("NPCUL_INT_00", "Black Interior Trim")
	AddTextEntry("NPCUL_INT_01", "Wood Interior Trim")
	AddTextEntry("NPCUL_INT_02", "Carbon Interior Trim")
	--M5
	
	--Mustang
	AddTextEntry('0x1AC92852','RTR Spec2')
	AddTextEntry('0x2C2380BA','Spoiler2')
	AddTextEntry('0x4C1A2A85','Works Motorsport')
	AddTextEntry('0x6FD3F1F8','Eleanor')
	AddTextEntry('0x7DF2EA80','Raijin2')
	AddTextEntry('0x9D8FADDD','Shelby GT350R')
	AddTextEntry('0x1DE74E20','Shelby GT350R')
	AddTextEntry('0x30C1A8A7','Works Motorsport')
	AddTextEntry('0x41F1AC56','Spoiler1')
	AddTextEntry('0x60FA0F67','Mustang Cage')
	AddTextEntry('0x70AF09D0','Shelby GT350R')
	AddTextEntry('0x70B14FFD','Shelby GT350R')
	AddTextEntry('0x85ACF9F0','Works Motorsport')
	AddTextEntry('0x86E73640','RTR Spec5')
	AddTextEntry('0x95BA78B3','RTR Spec2')
	AddTextEntry('0x418E156D','Apollo Edition')
	AddTextEntry('0x683C9DB8','RTR Spec5')
	AddTextEntry('0x776B5D6D','Raijin')
	AddTextEntry('0x8733A0BF','RTR Spec5')
	AddTextEntry('0x9531D2D5','Spoiler3')
	AddTextEntry('0x27905D86','Works Motorsport')
	AddTextEntry('0x303598BD','Eleanor')
	AddTextEntry('0x1397746B','Shelby GT350R')
	AddTextEntry('0x78650322','RTR Spec2')
	AddTextEntry('0xB6C81C42','Ford Mustang GT')
	AddTextEntry('0xB111D0B9','RTR Spec5')
	AddTextEntry('0xB7059BE1','Shelby GT350R')
	AddTextEntry('0xD2F44E49','Mustang GT')
	AddTextEntry('0xE1FA6C65','RTR Spec2')
	--C7
	AddTextEntry('0x4A1931C5','Z06')
	AddTextEntry('0x56DF3703','Z06')
	AddTextEntry('0x342378AB','Chevrolet Corvette Stingray(C7) 14')
	AddTextEntry('0x35966909','Roof')
	AddTextEntry('0xB3A4AA28','Hennessy')
	AddTextEntry('0xC2D17AE5','Z06')
	AddTextEntry('0xC440B206','C7R Edition')
	AddTextEntry('0xCC7F463E','Hennessy')
	AddTextEntry('0xCE8648AE','Hennessy')
	AddTextEntry('0xD94B5B62','Z06')
	AddTextEntry('0xF5ACE7AB','Z06')
	--Challenger
	AddTextEntry('0x23B6AF16','SRT Spoiler')
	--News
	AddTextEntry('0xE3613EAD','LSBN News')
	AddTextEntry('0xD11A9A20','LSBN News Inverse')
	AddTextEntry('0x413AFA63','Weazel News')
	--Everything Else
	
end)
