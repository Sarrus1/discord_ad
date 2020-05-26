#include <sourcemod>
#include <colorvariables>

#pragma semicolon 1
#pragma newdecls required

ConVar cDiscord;

public Plugin myinfo = {
    name        = "[ANY] Discord Link",
    author      = "Sarrus",
    description = "A plugin that returns the url of a discord server when !discord is typed in chat",
    version     = "1.0",
    url         = ""
};

public void OnPluginStart()
{
    RegConsoleCmd("sm_discord", Print_Discord);

    LoadTranslations("discord_ad.phrases");

    cDiscord = CreateConVar("sm_discord_ad_url", "", "Type the link of the discord invite here");

    AutoExecConfig(true, "plugin.discord_ad");
}


public Action Print_Discord(int client, int args)
{
    char szBuffer[PLATFORM_MAX_PATH];
    cDiscord.GetString(szBuffer, sizeof(szBuffer));

    if (IsClientInGame(client) && !IsFakeClient(client)){
        CPrintToChat(client, "%t", "Discord_Ad", szBuffer);
    }
    return Plugin_Handled;
}
