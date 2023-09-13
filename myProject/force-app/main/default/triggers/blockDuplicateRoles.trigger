trigger blockDuplicateRoles on OpportunityContactRole(after insert, after update) {
  // We need these values for our query
  Set<Id> oppIds = new Set<Id>(), conIds = new Set<Id>();
  Set<String> roles = new Set<String>();
  // Keeps track of existing roles
  Map<OpportunityContactRole, OpportunityContactRole> roleMatch = new Map<OpportunityContactRole, OpportunityContactRole>();
  for(OpportunityContactRole record: Trigger.new) {
    oppIds.add(record.OpportunityId);
    conIds.add(record.ContactId);
    roles.add(record.Role);
    // This is a composite key using three values
    OpportunityContactRole key = new OpportunityContactRole(OpportunityId = record.OpportunityId,ContactId = record.ContactId,Role = record.Role);
    // Oops, duplicate contact role in this trigger context!
    if(roleMatch.containsKey(key)) {
      record.addError('This role matches an existing contact for this opportunity.');
    } else {
      // Keep track of this role for later...
      roleMatch.put(key, record);
    }
  }
  for(OpportunityContactRole record: [SELECT ContactId, OpportunityId, Role FROM OpportunityContactRole WHERE OpportunityId = :oppIds AND ContactId = :conIds AND Role = :roles]) {
    // Create our composite key for each match found
    OpportunityContactRole key = new OpportunityContactRole(OpportunityId = record.OpportunityId,ContactId = record.ContactId,Role = record.Role);
    OpportunityContactRole incoming = roleMatch.get(key);
    // If this record does not match the Id queried, it is a duplicate!
    if(incoming != null && incoming.Id != record.Id) {
      incoming.addError('This role matches an existing contact for this opportunity.');
    }
  }
}