/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 12-17-2025
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
public with sharing class UserinfoDetails {
    public static void  UserinfoDetails() {
        
       
        datetime LastLoginDates;
        string localtime = string.valueOf(UserInfo.gettimeZone());
        system.debug('localtime'+localtime);
        String userid = UserInfo.getuserid();
        system.debug('userid'+userid);
        
        List<user> userlist = [select id , name , LastLoginDate ,email from user where id =:userid limit 1];
        for(user userlist1 : userlist)
        {
            LastLoginDates = userlist1.LastLoginDate;
            system.debug('LastLoginDates'+LastLoginDates);
        }
    }
}