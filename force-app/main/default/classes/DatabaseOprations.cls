public class DatabaseOprations {
    
    public static void insertdemo()
    {
        Account acc = new Account();
        acc.Name ='salesforce make sence1';
        
        
        Account acc2 = new Account();
        acc2.Name ='salesforce make sence2';
        
        List<account> accNew =new list<account>();
        accNew.add(acc);
        accNew.add(acc2);
        insert accNew;
    }
    
    public static void updateDemo(string ids)
    {
        List<Contact> con =[select id , Title from contact where id=:ids];
        if(con.Size() > 0){
            if(con[0].Title =='lokesh ram')
            {
                con[0].Title ='loki'; 
            }
            
        }
        
        
        update con;
    }
    
    public  static Void deletDemo()
    {
        List<opportunity> oop =[select id ,StageName from opportunity where StageName ='Closed Won'];
        
        system.debug('i am in outside block'+oop.size());
        if(oop.size() > 0)
        {
            system.debug('i am in insdie block');
            delete oop;
        }
    }
    
    public static void UpdateDemoList(string stagName)
    { 
        if(stagName !=null)
        {
            List<Account> accNewListToUpdate =new List<Account>();
            List<account> accList =[select id, name ,Rating from Account where Rating =:stagName];
            if(accList.size() >0)
            {
                for(Account accNewList : accList)
                {
                    accNewList.Rating ='Warm';
                    accNewListToUpdate.add(accNewList);
                } 
            }
            
            
            update accNewListToUpdate;
        }
    }
    
    public static void upsertDemo()
    {
        List<account> accNew =new list<account>();
        Account acc = new Account();
        acc.Name ='SMS 1';
        
        
        Account acc2 = new Account();
        acc2.Name ='SMS 2';
        
       
        accNew.add(acc);
        accNew.add(acc2);
        
        List<account> accUpdate = [select id, name ,Rating from Account where Rating = 'Warm'];
         if(accUpdate.size() >0)
            {
                for(Account accNewList : accUpdate)
                {
                    accNewList.Rating ='Hot';
                    accNew.add(accNewList);
                } 
            }
        upsert accNew; 
       system.debug('List is : '+accNew );
    }
    	
    
    public static void deletUndeletDemo()
    {
        List<opportunity> opplist =[SELECT Id, StageName ,isDeleted FROM opportunity where isDeleted = true ALL ROWS];
        system.debug('opplist'+opplist);
        if(opplist.size()>0)
        {
            undelete opplist; 
        }
    }
    
    public static string databseMethodsDemo()
    {
        string finalresulr ='success';
        List<account> accNew =new list<account>();
        Account acc = new Account();
        acc.Name ='database oprations 12';
        
        
        Account acc2 = new Account();
        acc2.Name ='database oprations 23';
        
        
        accNew.add(acc);
        accNew.add(acc2);
        insert accNew;
        set<id> getsucsessrecordsids =new set<id>();
        set<string> getfailurerecords =new set<string>();
        List<Database.SaveResult> saveresults = Database.insert(accNew,false);
        for(Database.SaveResult data :saveresults)
        {
            if(data.isSuccess())
            {
                getsucsessrecordsids.add(data.getId());
            }
            else 
            {
                for(Database.Error errors :data.getErrors()) 
                {
                    getfailurerecords.add(errors.getMessage() +' --'+errors.getFields());
                }
                
            }
            
        }
        system.debug('sucess records ids :'+getsucsessrecordsids);
        system.debug('failure massage :'+getfailurerecords);
        return finalresulr;  
    }
    
    public static List<contact> createContact(string firstNames, string LastNames,string emailIds)
    {
        List<contact> conNewList =new List<contact>();
           
        if(!string.isBlank(LastNames))
        {
          Contact con =new Contact();
          con.FirstName = firstNames;
          con.LastName  = LastNames;
          con.Email = emailIds;
          conNewList.add(con);
        }
         
         if(conNewList.size() > 0)
         {
             insert conNewList;
         }
          
          return conNewList;
    }
    
}