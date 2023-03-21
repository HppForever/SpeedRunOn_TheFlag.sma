// Подключаем нужные инклуды для корректной работы плагина

#include <amxmodx>
#include <amxmisc>
#include <hamsandwich>
#include <fun>


/*===========================Объявляем гл. переменные для скорости бега с различными оружиями, в методе plugin_init установим ним значения============================*/


new Enable_Plugin;                            // Объявляем переменную "Enable_Plugin" для функции on/off плагина
new Normal_Weapons_SpeedRun;                 // Объявляем переменную "Normal_Weapons_SpeedRun" значение которой является скорость привилегейного игрока с ножом и тд
new Awp_Weapons_SpeedRun;                   // Объявляем переменную "Awp_Weapons_SpeedRun" значение которой является скорость привилегейного игрока с "AWP"
new AK_47_Weapons_SpeedRun;                // Объявляем переменную "AK_47_Weapons_SpeedRun" значение которой является скорость привилегейного игрока с "AK47"
new AUG_Weapons_SpeedRun;                 // Объявляем переменную "AUG_Weapons_SpeedRun" значение которой является скорость привилегейного игрока с "AUG"
new Famas_Weapons_SpeedRun;              // Объявляем переменную "Famas_Weapons_SpeedRun" значение которой является скорость привилегейного игрока с "Famas"
new GalilAR_Weapons_SpeedRun;           // Объявляем переменную "GalilAR_Weapons_SpeedRun" значение которой является скорость привилегейного игрока с "Galil"
new G3SG1_Weapons_SpeedRun;            // Объявляем переменную "G3SG1_Weapons_SpeedRun" значение которой является скорость привилегейного игрока с "G3SG1"
new Scout_Weapons_SpeedRun;           // Объявляем переменную "Scout_Weapons_SpeedRun" значение которой является скорость привилегейного игрока с "Scout"
new M249_Weapons_SpeedRun;           // Объявляем переменную "M249_Weapons_SpeedRun" значение которой является скорость привилегейного игрока с "M249"
new M3_Weapons_SpeedRun;            // Объявляем переменную "M3_Weapons_SpeedRun" значение которой является скорость привилегейного игрока с "M3"
new M4A1_Weapons_SpeedRun;         // Объявляем переменную "M4A1_Weapons_SpeedRun" значение которой является скорость привилегейного игрока с "M4A1"
new P90_Weapons_SpeedRun;         // Объявляем переменную "P90_Weapons_SpeedRun" значение которой является скорость привилегейного игрока с "P90"
new SG550_Weapons_SpeedRun;      // Объявляем переменную "SG550_Weapons_SpeedRun" значение которой является скорость привилегейного игрока с "SG550"
new SG552_Weapons_SpeedRun;     // Объявляем переменную "SG552_Weapons_SpeedRun" значение которой является скорость привилегейного игрока с "SG552"
new XM1014_Weapons_SpeedRun;   // Объявляем переменную "XM1014_Weapons_SpeedRun" значение которой является скорость привилегейного игрока с "XM1014"
new bool: g_HaveSpeed[33];    // Объявляем булевый массив "g_HaveSpeed" нужный для корректной работы установки скорости бега игроку с флагами
new AccessFlag_SpeedRun[24];             // Объявляем массив "AccessFlag_SpeedRun" типа "string" который будет хранить в себе флаги доступа к функции этого плагина

public plugin_init()

{
    register_plugin("SpeedRunOn_TheFlag", "1.0", "hpp forever"); // Автор плагина
	
	register_cvar("AccessFlag_SpeedRun","pnm"); // Объявляем квар который будет отвечать за флаги доступа к функции этого плагина
	get_cvar_string("AccessFlag_SpeedRun", AccessFlag_SpeedRun, charsmax(AccessFlag_SpeedRun)); // Читаем и записываем данные из квара "AccessFlag_SpeedRun" в массив "AccessFlag_SpeedRun"
	
    Enable_Plugin = register_cvar("SpeedRunOn_TheFlag_Enable", "1"); // Объявляем квар который будет отвечать за on/off плагина (1 - включить, 0 - выключить)
	

/*==================================================Установка значений скоростей бега для разных оружий================================================================*/


    Scout_Weapons_SpeedRun = register_cvar("Amx_Scout_Weapons_SpeedRun", "286");                  // Скорость бега с "Scout"
    Normal_Weapons_SpeedRun = register_cvar("Amx_Normal_Weapons_SpeedRun", "275");               // Скорость бега с ножом, пистолетами, гранатами
	P90_Weapons_SpeedRun = register_cvar("Amx_P90_Weapons_SpeedRun", "269");                    // Скорость бега с "P90"
	AUG_Weapons_SpeedRun = register_cvar("Amx_AUG_Weapons_SpeedRun", "264");                   // Скорость бега с "Aug"
	XM1014_Weapons_SpeedRun = register_cvar("Amx_XM1014_Weapons_SpeedRun", "264");            // Скорость бега с "XM1014"
	Famas_Weapons_SpeedRun = register_cvar("Amx_Famas_Weapons_SpeedRun", "264");             // Скорость бега с "Famas"
	GalilAR_Weapons_SpeedRun = register_cvar("Amx_GalilAR_Weapons_SpeedRun", "264");        // Скорость бега с "Galil"
	SG552_Weapons_SpeedRun = register_cvar("Amx_SG552_Weapons_SpeedRun", "258");           // Скорость бега с "SG552"
	M3_Weapons_SpeedRun = register_cvar("Amx_M3_Weapons_SpeedRun", "253");                // Скорость бега с "M3"
	M4A1_Weapons_SpeedRun = register_cvar("Amx_M4A1_Weapons_SpeedRun", "253");           // Скорость бега с "M4A1" 
	AK_47_Weapons_SpeedRun = register_cvar("Amx_AK_47_Weapon_SpeedRuns", "243");        // Скорость бега с "AK47"
	M249_Weapons_SpeedRun = register_cvar("Amx_M249_Weapons_SpeedRun", "242");         // Скорость бега с "M249" 
	Awp_Weapons_SpeedRun = register_cvar("Amx_Weapons_SpeedRun", "231");              // Скорость бега с "Awp"
	G3SG1_Weapons_SpeedRun = register_cvar("Amx_G3SG1_Weapons_SpeedRun", "231");     // Скорость бега с "G3sg1"
    SG550_Weapons_SpeedRun = register_cvar("Amx_SG550_Weapons_SpeedRun", "231");    // Скорость бега с "SG550"	

    RegisterHam(Ham_Spawn, "player", "PlayerSpawn", 1); // Отлавливаем спавн игрока дабы дать ему скорость (если конечно у него присутствуют флаги доступа с макроса)
    register_event("CurWeapon", "Event_Cur_Weapon", "be", "1=1");
}

public PlayerSpawn(id)

{
    if(get_pcvar_num(Enable_Plugin) == 0) // Если квар "SpeedRunOn_TheFlag_Enable" равен нулю - плагин прекращает свою работу
		
		{
			return; // Возврат пустого значения из метода "PlayerSpawn" (завершение работы плагина)
		}

    if (get_user_flags(id) & read_flags("AccessFlag_SpeedRun")) // Если у игрока есть хоть один флаг из "AccessFlag_SpeedRun" - будет вызвана функция "Set_UserSpeed"
		
        {
           g_HaveSpeed[id] = true;
           Set_UserSpeed(id);
        }
		
    else // Если у игрока нету хоть одного флага из "AccessFlag_SpeedRun" - функция "Set_UserSpeed" не будет вызвана (алгоритм плагина продолжаться не будет)
		
        {
          g_HaveSpeed[id] = false;
        }
}

public Set_UserSpeed(id)

{
        if(get_pcvar_num(Enable_Plugin) == 0) // Если квар "SpeedRunOn_TheFlag_Enable" равен нулю - метод "Set_UserSpeed" прекращает свою работу
		
		{
			return; // Возврат пустого значения из метода "Set_UserSpeed" (завершение работы плагина)
		}
		
	    if(!(get_user_flags(id) & read_flags("AccessFlag_SpeedRun"))) // Проверки на флаги, если флаг не будет найден у пользователя - он не получит доступ к функции плагина
		
	    {
		    return; // Возврат пустого значения из метода "Set_UserSpeed" (завершение работы плагина)
	    }
		
		
/*======================================Установка разных значений скорости бега с оружием(скорость зависит от выбранного оружия)=======================================*/

		
	    if (read_data(2) == CSW_AWP)
			set_user_maxspeed(id, get_pcvar_float(Awp_Weapons_SpeedRun));    // Установка скорости игроку который прошел проверку на флаг для оружия "Awp"
		
	    if (read_data(2) == CSW_AK47)
			set_user_maxspeed(id, get_pcvar_float(AK_47_Weapons_SpeedRun));  // Установка скорости игроку который прошел проверку на флаг для оружия "AK47"
		
	    if (read_data(2) == CSW_AUG)
			set_user_maxspeed(id, get_pcvar_float(AUG_Weapons_SpeedRun));    // Установка скорости игроку который прошел проверку на флаг для оружия "AUG"
		
		if (read_data(2) == CSW_FAMAS)
			set_user_maxspeed(id, get_pcvar_float(Famas_Weapons_SpeedRun));  // Установка скорости игроку который прошел проверку на флаг для оружия "FAMAS"
		
		if (read_data(2) == CSW_GALIL)
			set_user_maxspeed(id, get_pcvar_float(GalilAR_Weapons_SpeedRun)); // Установка скорости игроку который прошел проверку на флаг для оружия "GALIL"
		
		if (read_data(2) == CSW_G3SG1)
			set_user_maxspeed(id, get_pcvar_float(G3SG1_Weapons_SpeedRun));   // Установка скорости игроку который прошел проверку на флаг для оружия "G3SG1"
		
		if (read_data(2) == CSW_SCOUT)
			set_user_maxspeed(id, get_pcvar_float(Scout_Weapons_SpeedRun));   // Установка скорости игроку который прошел проверку на флаг для оружия "Scout"
		
		if (read_data(2) == CSW_M249)
			set_user_maxspeed(id, get_pcvar_float(M249_Weapons_SpeedRun));   // Установка скорости игроку который прошел проверку на флаг для оружия "M249"
		
		if (read_data(2) == CSW_M3)
			set_user_maxspeed(id, get_pcvar_float(M3_Weapons_SpeedRun));     // Установка скорости игроку который прошел проверку на флаг для оружия "M3"
		
		if (read_data(2) == CSW_M4A1)
			set_user_maxspeed(id, get_pcvar_float(M4A1_Weapons_SpeedRun));   // Установка скорости игроку который прошел проверку на флаг для оружия "M4A1"
		
		if (read_data(2) == CSW_P90)
			set_user_maxspeed(id, get_pcvar_float(P90_Weapons_SpeedRun));    // Установка скорости игроку который прошел проверку на флаг для оружия "P90"
		
		if (read_data(2) == CSW_SG550)
			set_user_maxspeed(id, get_pcvar_float(SG550_Weapons_SpeedRun));  // Установка скорости игроку который прошел проверку на флаг для оружия "SG550"
		
		if (read_data(2) == CSW_SG552)
			set_user_maxspeed(id, get_pcvar_float(SG552_Weapons_SpeedRun));  // Установка скорости игроку который прошел проверку на флаг для оружия "SG552"
		
		if (read_data(2) == CSW_XM1014)
			set_user_maxspeed(id, get_pcvar_float(XM1014_Weapons_SpeedRun));  // Установка скорости игроку который прошел проверку на флаг для оружия "XM1014"
		
		if (read_data(2) == CSW_VESTHELM || read_data(2) == CSW_VEST || read_data(2) == CSW_KNIFE || read_data(2) == CSW_DEAGLE || read_data(2) == CSW_FLASHBANG || read_data(2) == CSW_TMP || read_data(2) == CSW_MP5NAVY || read_data(2) == CSW_GLOCK18 || read_data(2) == CSW_USP || read_data(2) == CSW_UMP45 || read_data(2) ==CSW_FIVESEVEN || read_data(2) == CSW_ELITE || read_data(2) == CSW_SMOKEGRENADE || read_data(2) == CSW_MAC10 || read_data(2) == CSW_C4 || read_data(2) == CSW_HEGRENADE || read_data(2) == CSW_P228)
			
			{
				set_user_maxspeed(id, get_pcvar_float(Normal_Weapons_SpeedRun));  // Установка скорости игроку который прошел проверку на флаг для обычных оружий
			}
}

public Event_Cur_Weapon(id)

{
    if(get_pcvar_num(Enable_Plugin) == 0) // Если квар "SpeedRunOn_TheFlag_Enable" равен нулю - метод "Event_Cur_Weapon" прекращает свою работу
		
		{
			return; // Возврат пустого значения из метода "Set_UserSpeed" (завершение работы плагина)
		}
	
	
/*======================================Установка разных значений скорости бега с оружием(скорость зависит от выбранного оружия)=======================================*/
    
	
            if (read_data(2) == CSW_AWP) // Установка скорости игроку который прошел проверку на флаг для оружия "Awp"
			
			{
				if(g_HaveSpeed[id] && get_user_maxspeed(id) < get_pcvar_float(Awp_Weapons_SpeedRun))
                set_user_maxspeed(id, get_pcvar_float(Awp_Weapons_SpeedRun));
			}
		
		    if (read_data(2) == CSW_AK47) // Установка скорости игроку который прошел проверку на флаг для оружия "AK47"
			
			{
				if(g_HaveSpeed[id] && get_user_maxspeed(id) < get_pcvar_float(AK_47_Weapons_SpeedRun))
                set_user_maxspeed(id, get_pcvar_float(AK_47_Weapons_SpeedRun));
			}
			
			if (read_data(2) == CSW_AUG) // Установка скорости игроку который прошел проверку на флаг для оружия "AUG"
			
			{
				if(g_HaveSpeed[id] && get_user_maxspeed(id) < get_pcvar_float(AUG_Weapons_SpeedRun))
                set_user_maxspeed(id, get_pcvar_float(AUG_Weapons_SpeedRun));
			}
			
			if (read_data(2) == CSW_FAMAS) // Установка скорости игроку который прошел проверку на флаг для оружия "FAMAS"
			
			{
				if(g_HaveSpeed[id] && get_user_maxspeed(id) < get_pcvar_float(Famas_Weapons_SpeedRun))
                set_user_maxspeed(id, get_pcvar_float(Famas_Weapons_SpeedRun));
			}
			
			if (read_data(2) == CSW_GALIL) // Установка скорости игроку который прошел проверку на флаг для оружия "GALIL"
			
			{
                if(g_HaveSpeed[id] && get_user_maxspeed(id) < get_pcvar_float(GalilAR_Weapons_SpeedRun))
                set_user_maxspeed(id, get_pcvar_float(GalilAR_Weapons_SpeedRun));
			}
			
			if (read_data(2) == CSW_G3SG1) // Установка скорости игроку который прошел проверку на флаг для оружия "G3SG1"
			
			{
                if(g_HaveSpeed[id] && get_user_maxspeed(id) < get_pcvar_float(G3SG1_Weapons_SpeedRun))
                set_user_maxspeed(id, get_pcvar_float(G3SG1_Weapons_SpeedRun));
			}
			
			if (read_data(2) == CSW_SCOUT) // Установка скорости игроку который прошел проверку на флаг для оружия "Scout"
			
			{
                if(g_HaveSpeed[id] && get_user_maxspeed(id) < get_pcvar_float(Scout_Weapons_SpeedRun))
                set_user_maxspeed(id, get_pcvar_float(Scout_Weapons_SpeedRun));
			}
			
			if (read_data(2) == CSW_M249) // Установка скорости игроку который прошел проверку на флаг для оружия "M249"
			
			{
                if(g_HaveSpeed[id] && get_user_maxspeed(id) < get_pcvar_float(M249_Weapons_SpeedRun))
                set_user_maxspeed(id, get_pcvar_float(M249_Weapons_SpeedRun));
			}
			
			if (read_data(2) == CSW_M3) // Установка скорости игроку который прошел проверку на флаг для оружия "M3"
			
			{
                if(g_HaveSpeed[id] && get_user_maxspeed(id) < get_pcvar_float(M3_Weapons_SpeedRun))
                set_user_maxspeed(id, get_pcvar_float(M3_Weapons_SpeedRun));
			}
			
			if (read_data(2) == CSW_M4A1) // Установка скорости игроку который прошел проверку на флаг для оружия "M4A1"
			
			{
                if(g_HaveSpeed[id] && get_user_maxspeed(id) < get_pcvar_float(M4A1_Weapons_SpeedRun))
                set_user_maxspeed(id, get_pcvar_float(M4A1_Weapons_SpeedRun));
			}
			
			if (read_data(2) == CSW_P90) // Установка скорости игроку который прошел проверку на флаг для оружия "P90"
			
			{
                if(g_HaveSpeed[id] && get_user_maxspeed(id) < get_pcvar_float(P90_Weapons_SpeedRun))
                set_user_maxspeed(id, get_pcvar_float(P90_Weapons_SpeedRun));
			}
			
			if (read_data(2) == CSW_SG550) // Установка скорости игроку который прошел проверку на флаг для оружия "SG550"
			
			{
                if(g_HaveSpeed[id] && get_user_maxspeed(id) < get_pcvar_float(SG550_Weapons_SpeedRun))
                set_user_maxspeed(id, get_pcvar_float(SG550_Weapons_SpeedRun));
			}
			
			if (read_data(2) == CSW_SG552) // Установка скорости игроку который прошел проверку на флаг для оружия "SG552"
			
			{
                if(g_HaveSpeed[id] && get_user_maxspeed(id) < get_pcvar_float(SG552_Weapons_SpeedRun))
                set_user_maxspeed(id, get_pcvar_float(SG552_Weapons_SpeedRun));
			}
			
			if (read_data(2) == CSW_XM1014) // Установка скорости игроку который прошел проверку на флаг для оружия "XM1014"
			
			{
                if(g_HaveSpeed[id] && get_user_maxspeed(id) < get_pcvar_float(XM1014_Weapons_SpeedRun))
                set_user_maxspeed(id, get_pcvar_float(XM1014_Weapons_SpeedRun));
			}
			
			if (read_data(2) == CSW_VESTHELM || read_data(2) == CSW_VEST || read_data(2) == CSW_KNIFE || read_data(2) == CSW_DEAGLE || read_data(2) == CSW_FLASHBANG || read_data(2) == CSW_TMP || read_data(2) == CSW_MP5NAVY || read_data(2) == CSW_GLOCK18 || read_data(2) == CSW_USP || read_data(2) == CSW_UMP45 || read_data(2) ==CSW_FIVESEVEN || read_data(2) == CSW_ELITE || read_data(2) == CSW_SMOKEGRENADE || read_data(2) == CSW_MAC10 || read_data(2) == CSW_C4 || read_data(2) == CSW_HEGRENADE || read_data(2) == CSW_P228)
			
			{
                if(g_HaveSpeed[id] && get_user_maxspeed(id) < get_pcvar_float(Normal_Weapons_SpeedRun)) 
                set_user_maxspeed(id, get_pcvar_float(Normal_Weapons_SpeedRun)); // Установка скорости игроку который прошел проверку на флаг для обычных оружий
			}
} 