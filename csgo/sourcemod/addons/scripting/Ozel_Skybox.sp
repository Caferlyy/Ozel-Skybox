#include < sourcemod >
#include < sdktools >

#pragma semicolon 1



#define PLUGIN_VERSION	"1.1"
#define INDEX 0


ConVar cvarAktif;
ConVar cvarSkybox_Caferly;


public Plugin:myinfo =
{
	name = "Özel Skybox.",
	author = "Caferly!",
	description = "Belirlediğiniz Skybox her mapte açılır.",
	version = PLUGIN_VERSION,
	url = "hovn.com"
};

public void OnPluginStart ( )
{
	cvarAktif = CreateConVar ( "sm_ozel_skybox", "1", "Eklenti Aktifleştirmek için : 1 Deaktif yapmak için : 2", _, true, 0.0, true, 1.0 );
	cvarSkybox_Caferly  = CreateConVar ( "sm_skybox_isim", "mr_07", "Skybox İsmi Buraya girilecek. Ardından sunucuyu restartlamanız yeterli.", _ );
	

	AutoExecConfig ( true, "Caferly_Ozel_Skybox" );
	
}

public void OnMapStart ( )
{
	if ( GetConVarBool ( cvarAktif ) ) {
		SkyboxDosyalar ( );
		SkyboxDegis ( );
	}
}

public void OnClientPostAdminCheck(int client)
{
    if (!IsFakeClient(client)) 
    {
        CreateTimer(1.0, Timer_DeaktifSkybox, client);
    }
}

public Action Timer_DeaktifSkybox(Handle timer, int client)
{
	if (!IsClientInGame(client))
        return Plugin_Stop;
	
	SetEntProp(client, Prop_Send, "m_skybox3d.area", 255);
	
	return Plugin_Continue;
}

public void SkyboxDosyalar ( ) 
{
	
	
	char newskybox [ 32 ];
	GetConVarString ( cvarSkybox_Caferly, newskybox, sizeof ( newskybox ) );
		
	char skyname_download1 [ 128 ];
	Format ( skyname_download1, sizeof ( skyname_download1 ), "materials/skybox/%sup.vtf", newskybox );
	AddFileToDownloadsTable ( skyname_download1 );
	
	char skyname_dld20 [ 128 ];
	Format ( skyname_dld20, sizeof ( skyname_dld20 ), "materials/skybox/%sdn.vtf", newskybox );
	AddFileToDownloadsTable ( skyname_dld20 );
	
	char skyname_dld21 [ 128 ];
	Format ( skyname_dld21, sizeof ( skyname_dld21 ), "materials/skybox/%sft.vtf", newskybox );
	AddFileToDownloadsTable ( skyname_dld21 );
	
	char skyname_dld22 [ 128 ];
	Format ( skyname_dld22, sizeof ( skyname_dld22 ), "materials/skybox/%slf.vtf", newskybox );
	AddFileToDownloadsTable ( skyname_dld22 );
	
	char skyname_dld23 [ 128 ];
	Format ( skyname_dld23, sizeof ( skyname_dld23 ), "materials/skybox/%srt.vtf", newskybox );
	AddFileToDownloadsTable ( skyname_dld23 );
	
	char skyname_dld24 [ 128 ];
	Format ( skyname_dld24, sizeof ( skyname_dld24 ), "materials/skybox/%sbk.vtf", newskybox );
	AddFileToDownloadsTable ( skyname_dld24 );
	

	
	char skyname_download3 [ 128 ];
	Format ( skyname_download3, sizeof ( skyname_download3 ), "materials/skybox/%sup.vmt", newskybox );
	AddFileToDownloadsTable ( skyname_download3 );
	
	char skyname_dld30 [ 128 ];
	Format ( skyname_dld30, sizeof ( skyname_dld30 ), "materials/skybox/%sdn.vmt", newskybox );
	AddFileToDownloadsTable ( skyname_dld30 );
	
	char skyname_dld31 [ 128 ];
	Format ( skyname_dld31, sizeof ( skyname_dld31 ), "materials/skybox/%sft.vmt", newskybox );
	AddFileToDownloadsTable ( skyname_dld31 );
	
	char skyname_dld32 [ 128 ];
	Format ( skyname_dld32, sizeof ( skyname_dld32 ), "materials/skybox/%slf.vmt", newskybox );
	AddFileToDownloadsTable ( skyname_dld32 );
	
	char skyname_dld33 [ 128 ];
	Format ( skyname_dld33, sizeof ( skyname_dld33 ), "materials/skybox/%srt.vmt", newskybox );
	AddFileToDownloadsTable ( skyname_dld33 );
	
	char skyname_dld34 [ 128 ];
	Format ( skyname_dld34, sizeof ( skyname_dld34 ), "materials/skybox/%sbk.vmt", newskybox );
	AddFileToDownloadsTable ( skyname_dld34 );
		

}

public SkyboxDegis ( )
{
	if ( GetConVarBool ( cvarAktif ) )
	{
		char newskybox  [ 32 ];
		GetConVarString ( cvarSkybox_Caferly, newskybox, sizeof ( newskybox ) );
		

		if ( strcmp ( newskybox, "", false ) !=0 )
		{

			DispatchKeyValue ( INDEX, "skyname", newskybox );
		}
	}
}



/// batın ben yaptım desene bunu :D