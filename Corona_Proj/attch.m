classdef attch
    properties 
        
        StateName
         CaseValu
         DeathValu
        CountryName       
        CumulativeCaseValu 
        CumulativeDeathValu
        
       
    end
    methods    
        
        function ap=attch       
              ap.CountryName=[]; 
               
        end     
        
        function   [statobjlist,cntry,All,glob] = setdata(ap,arry)
    
    for i=1:size(arry,1)    
        statobjlist(i)=attch;  %list of state objs
        
                tempvalu=[arry{i,3:end}]; 
                statobjlist(i).CountryName= arry{i,1}; 
                statobjlist(i).StateName=arry{i,2};
                 statobjlist(i).CumulativeCaseValu=tempvalu(1:2:end);
                 statobjlist(i).CumulativeDeathValu=tempvalu(2:2:end);
                
                 
                 for t=1:length(statobjlist(1).CumulativeCaseValu)
                     if t==1
                         statobjlist(i).CaseValu(t)=statobjlist(i).CumulativeCaseValu(t);
                         statobjlist(i).DeathValu(t)=statobjlist(i).CumulativeDeathValu(t);
                     else
                         if (statobjlist(i).CumulativeCaseValu(t)-statobjlist(i).CumulativeCaseValu(t-1))<0
                             statobjlist (i).CaseValu(t)=0;
                         else
                             statobjlist(i).CaseValu(t)=statobjlist(i).CumulativeCaseValu(t)-statobjlist(i).CumulativeCaseValu(t-1); 
                             
                         end
                         if (statobjlist(i).CumulativeDeathValu(t)-statobjlist(i).CumulativeDeathValu(t-1))>=0
                         statobjlist(i).DeathValu(t)=statobjlist(i).CumulativeDeathValu(t)-statobjlist(i).CumulativeDeathValu(t-1);   
                         else
                             statobjlist(i).DeathValu(t)=0;
                         end
                     end
                 end  
                
    end 
 
    All=attch;
    glob=attch; 
    
    y=0;
    i=1;
    
   
    for e=1:length(statobjlist)
        y=y+1;
        cntry{i}(y)=statobjlist(e);   
        cntry{i}(1).StateName='All';
        
    All(i).CaseValu =cntry{i}(1).CaseValu;
    All(i).DeathValu =cntry{i}(1).DeathValu;
    All(i).CumulativeCaseValu =cntry{i}(1).CumulativeCaseValu;
    All(i).CumulativeDeathValu =cntry{i}(1).CumulativeDeathValu;
    All(i).CountryName =cntry{i}(1).CountryName;
        
           
        if e<length(statobjlist)
        if ~isequal(statobjlist(e).CountryName ,statobjlist(e+1).CountryName)==1      
            
          
                      
            
        if i==1
           glob.CaseValu=All(i).CaseValu;
           glob.DeathValu=All(i).DeathValu;
           glob.CumulativeCaseValu=All(i).CumulativeCaseValu;
           glob.CumulativeDeathValu=All(i).CumulativeDeathValu;
        else
           glob.CaseValu=glob.CaseValu+All(i).CaseValu;
           glob.DeathValu=glob.DeathValu+All(i).DeathValu;
           glob.CumulativeCaseValu=glob.CumulativeCaseValu+All(i).CumulativeCaseValu;
           glob.CumulativeDeathValu=glob.CumulativeDeathValu+All(i).CumulativeDeathValu;
         end
            
        y=0;
        i=i+1;
        end
        end
            
    end 
    
    
        glob.CaseValu=glob.CaseValu+All(i).CaseValu;
        glob.DeathValu=glob.DeathValu+All(i).DeathValu;
        glob.CumulativeCaseValu=glob.CumulativeCaseValu+All(i).CumulativeCaseValu;
        glob.CumulativeDeathValu=glob.CumulativeDeathValu+All(i).CumulativeDeathValu;
        
  
        end
    end
end
