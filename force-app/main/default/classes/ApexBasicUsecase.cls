/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 11-26-2025
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
public class ApexBasicUsecase {
    
   public static string passwordcheck = 'Loki@0712';
   public static integer count =1; 
    public static list<string> vowelString =new List<string>{'a','e','i','o','u'} ;
   
    
    //1.apex checking password correct and or incorrect or number of attempt show error
   public static void Checkpassword()
   {
       string finalchek ='' ;
       finalchek = checkPassword('dvdsvd');
       system.debug('finalchek'+finalchek);
       finalchek = checkPassword('dvdsvd');
       system.debug('finalchek'+finalchek);
       finalchek = checkPassword('dvdsvd');
       system.debug('finalchek'+finalchek);
       finalchek = checkPassword('dvdsvd');
       system.debug('finalchek'+finalchek);
   }
    
  public static string checkPassword(String password)
  {
       if(passwordcheck != password)
      {
         
          if(count >3)
          {
              system.debug('you cross you limnitetion');
             
          }
          count++;
          return 'failure';
      }
      else
      {
           return 'success';
      }
     
     
  }
 
    //2.attendance report checking no of days i attend the class 
  public static integer ApexBasicUsecase(map<string,boolean> noofDays)
  {
      integer noofdyasn =0;
      for(string dayss :noofDays.keyset())
      {
        boolean chekdays = noofDays.get(dayss);
          if(chekdays)
          {
              noofdyasn++;
          system.debug('no of days'+chekdays); 
          }
        
      }
      return noofdyasn;
  }
    //3.count statment is contain given string 
    public static integer checkstring(map<integer,string> statment)
    {
        integer count =0;
        for(integer countstatment : statment.keyset())
        {
            string statments= statment.get(countstatment);
            if(statments.containsIgnoreCase('lokesh hero'))
               {
                   system.debug('statment is'+statments);
                   count++;
               }
        }
       
        
        return count;
    }
     //4.nding mon max value using sort methods
    public static void findMinMx(map<string,integer> minMaxvalue)
    {
        List<integer> value = minMaxvalue.values();
        value.sort();
        system.debug('finding min value'+value[0]); 
        system.debug('finding max value'+value[value.size()-1]);
    }
    //5.bonus tracker Demo
    //
    public static decimal bonustracker(string emplyeeType)
    {
        decimal bonusTracker =25000;
        if(emplyeeType == 'Maneger')
        {
            bonusTracker +=5000;
        }
        else if(emplyeeType =='Region Head')
        {
            bonusTracker +=10000;
        }
        else if(emplyeeType == 'SVP')
        {
            bonusTracker +=15000;
        }
        else if(emplyeeType == 'CEO'  || emplyeeType =='CTO' || emplyeeType =='COO')
        {
              bonusTracker +=20000;
        }
        return bonusTracker;
    }
    //6. vowel count Tracker
    // my Nmae is lokesh paras ram 
    // I aM from nagpur Maharshtra
    // We are Bussiness pople from Nagpur
    // I love doing coding with Salesforce Make sance
    // Thanks Salesforce make sence for Everthing
    // happy to Open New Data Kumar sanu
    public static List<integer> VowelCounDemo(List<string> statment)
    {
        List<integer> VowelCount =new List<integer>();
        for(String statments :statment)
        {
            integer Vowelcounts = statments.countMatches(vowelString[0])
            + statments.toLowerCase().countMatches(vowelString[1])
             +  statments.toLowerCase().countMatches(vowelString[2])
              + statments.toLowerCase().countMatches(vowelString[3])
                + statments.toLowerCase().countMatches(vowelString[4]);
                   VowelCount.add(Vowelcounts);
        }
        
        return VowelCount;
    }
    //7.language selecter
    public static string languageSelecter(String Language)
    {
        String diffLanguage = 'englis';
      //  String diffLanguages = containsIgnoreCase(Language);
        switch on Language{
            when 'UAE'{
                diffLanguage ='araebic';
            }
            when 'India'
            {
                diffLanguage = 'Hindi';	
            }
            when 'Uk'
            {
                diffLanguage ='englis';
            }
            when 'Russian'
            {
                diffLanguage ='Russian';
            }
            when else
            {
                diffLanguage ='english'; 
            }
        }
        return diffLanguage;
    }
    
    //7. find the simple intrest 
    public static decimal caCulateSimpleIntrest(decimal principal ,decimal intrest ,integer timeinyears)
    {
        decimal simpleinters;
        if(principal!=null && intrest!=null && timeinyears!=null)
        {
             Decimal simpleIntrest = (principal*intrest*timeinyears)/100;
             simpleinters =simpleIntrest;
              system.debug('findsimpleintrest'+simpleinters);
            // return simpleIntrest;   
        }
       
        return simpleinters;
        
    }

    public static void SingleEmailMessageExample(String emailAddress)
    {
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        List<String> toAddresses = new List<String>{emailAddress};
        mail.setToAddresses(toAddresses);
        mail.setSubject('Hello from Apex');
        mail.setPlainTextBody('Single message from Apex via SingleEmailMessage');

        Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
    }
    
}