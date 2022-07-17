global function _CustomHideAndSeek_Init

enum eHASState
{
    IN_PROGRESS = 0
    WINNER_DECIDED = 1
}

struct {
    int hasState = eHASState.IN_PROGRESS

    array<entity> playerSpawnedProps

    int seeker_number
    int hidden_number
} file;

void function _CustomHideAndSeek_Init()
{
    AddCallback_OnClientConnected(void function(entity player) {thread _OnPlayerConnected(player)})
    AddCallback_OnPlayerKilled(void function(entity victim, entity attacker, var damageInfo) {thread _OnPlayerDied(victim, attacker, damageInfo)})

    thread RunHAS()
}

void function RunHAS()
{
    WaitForGameState(eGameState.Playing)
    for ( ; ; )
    {
        StartRound();
    }
    WaitForever()
}

void function StartRound()
{
    SetGameState(eGameState.Playing)

    entity Seeker = GetPlayerArray.getrandom()

    file.seeker_number = 1
    file.hidden_number = GetPlayerArray.len() - 1

    foreach(player in GetPlayerArray())
    {
        if (IsValid( player ))
        {
            if(player != Seeker){
                Remote_CallFunction_NonReplay(player, "ServerCallback_HideAndSeek_DoAnnouncement", 5, eHASAnnounce.ROUND_START_HIDDEN)       
            } else if (player == Seeker){
                Remote_CallFunction_NonReplay(player, "ServerCallback_HideAndSeek_DoAnnouncement", 5, eHASAnnounce.ROUND_START_SEEKER)
                player.FreezeControlsOnServer()
            }
            ClearInvincible(player)
            TpPlayerToSpawnPoint(player)
        }
    }

    wait 15
    float endTime = Time() + GetCurrentPlaylistVarFloat("round_time", 120)
    while( Time() <= endTime )
    {
        if(file.hasState == eHASState.WINNER_DECIDED)
            break
        WaitFrame()
    }
    file.hasState = eHASState.IN_PROGRESS
}

void function _OnPlayerConnected(entity player)
{
    if( !IsValid( player ) )
    return

    if( !IsAlive( player ) )
        _HandleRespawn( player )
    
    switch( GetGameState() )
    {

        case eGameState.WaitingForPlayers:
            player.FreezeControlsOnServer()
            break
        case eGameState.Playing:
            player.UnfreezeControlsOnServer();
            file.hidden_number = file.hidden_number + 1
            Remote_CallFunction_NonReplay( player, "ServerCallback_HideAndSeek_DoAnnouncement", 5, eTDMAnnounce.ROUND_START_HIDDEN )

        break
    default: 
        break
    }
}

void function _OnPlayerDied( entity victim, entity attacker, var damageInfo ) 
{
    switch( GetGameState() )
    {
        case eGameState.Playing:

            void functionref() victimHandleFunc = void function() : ( victim, attacker, damageInfo )
            {
                if(!IsValid( victim ))
                    return

                if( IsValid( victim ) )
                {
                    file.hidden_number = file.hidden_number - 1
                    file.seeker_number = file.seeker_number + 1
                    _HandleRespawn( victim )
                }
            }
            void functionref() attackerHandleFunc = void function() : (victim, attacker, damageInfo)  {
                if( IsValid(attacker) && attacker.IsPlayer() && IsAlive( attacker ) && attacker != victim )
                {
                    int score = GameRules_GetTeamScore(attacker.GetTeam());

                    score++;

                    GameRules_SetTeamScore(attacker.GetTeam(), score);

                    int invscore = attacker.GetPlayerNetInt( "kills" )
                    invscore++;

                    attacker.SetPlayerNetInt( "kills", invscore )
                }
            }
            thread victimHandleFunc()
            thread attackerHandleFunc()
            foreach( player in GetPlayerArray() )
            {
                Remote_CallFunction_NonReplay( player, "ServerCallback_HideAndSeek_PlayerKilled" )
            }
            break
        default:
        
    }
}