\ Model RAP
\ LP format - for model browsing. Use MPS format to capture full model detail.
Maximize
  53 assign[Carlos,Tester] + 27 assign[Carlos,JavaDeveloper]
   + 13 assign[Carlos,Architect] + 80 assign[Joe,Tester]
   + 47 assign[Joe,JavaDeveloper] + 67 assign[Joe,Architect]
   + 53 assign[Monika,Tester] + 73 assign[Monika,JavaDeveloper]
   + 47 assign[Monika,Architect]
Subject To
 job_Tester: assign[Carlos,Tester] + assign[Joe,Tester]
   + assign[Monika,Tester] = 1
 job_JavaDeveloper: assign[Carlos,JavaDeveloper]
   + assign[Joe,JavaDeveloper] + assign[Monika,JavaDeveloper] = 1
 job_Architect: assign[Carlos,Architect] + assign[Joe,Architect]
   + assign[Monika,Architect] = 1
 resource_Carlos: assign[Carlos,Tester] + assign[Carlos,JavaDeveloper]
   + assign[Carlos,Architect] <= 1
 resource_Joe: assign[Joe,Tester] + assign[Joe,JavaDeveloper]
   + assign[Joe,Architect] <= 1
 resource_Monika: assign[Monika,Tester] + assign[Monika,JavaDeveloper]
   + assign[Monika,Architect] <= 1
Bounds
Binaries
 assign[Carlos,Tester] assign[Carlos,JavaDeveloper]
 assign[Carlos,Architect] assign[Joe,Tester] assign[Joe,JavaDeveloper]
 assign[Joe,Architect] assign[Monika,Tester] assign[Monika,JavaDeveloper]
 assign[Monika,Architect]
End
