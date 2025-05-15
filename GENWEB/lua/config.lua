Config = {}
Config.ApiUrl = "solsticev.net" 

Config.SQL = "oxmysql"
Config.depoolsunmu = false

Config.Exports = {
    Progress = {
        CheckProgress = function()
            check = exports["is_ui"]:IsProgressBarActive()
            return check
        end
    },
    
    Cuff = {
        CuffCheck = function()
            check = exports["s4-cuffv3"]:HandCuffed()
            return check
        end
    },
    
}



