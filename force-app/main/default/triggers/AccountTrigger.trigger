trigger AccountTrigger on Account (before insert, before update) {
    if(trigger.isBefore && Trigger.isupdate){
        system.debug('i am in before update context');
        system.debug('trigger.newmap' + trigger.newmap.keyset());
        List<Opportunity> opportunityList= [select id, name, accountid from opportunity where accountid in:trigger.newmap.keyset()];
        system.debug('opportunityList' + opportunityList);
        Map<ID, String> accountIdoppNameMap = new Map<ID, String>();
        for(opportunity opp:opportunitylist){
            system.debug('inside for loop');
            system.debug('trigger.newmap' + opp);
      		accountIdoppNameMap.put(opp.accountID, opp.name);
        }
   	system.debug('trigger.newmap' + accountIdoppNameMap);
        for(ID accid: trigger.newMap.keyset()){
            if(accountIdoppNameMap.containskey(accid)){
                trigger.newmap.get(accid).adderror('this account is used by' + accountIdoppNameMap.get(accid));
            }
        }
    }
}