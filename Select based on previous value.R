# Given the following data frame
Var1 <- c(rep("A",4), rep("B",4),rep("C",4))
Var2 <- c(0, 100, 0, 0, 0, 0, 0, 100, 0, 100, 0, 100)
df <- data.frame(Var1, Var2); df

# We want to generate a new variable called Target able to identify for each level of Var1, 
# all Var2=100 after a Var2=0

df$Target <- NA
for(i in unique(df$Var1)){
  sel.var1 = which(df$Var1==i) # select a level of Var1 once at time
  sel.100 = sel.var1[which(df[sel.var1,]$Var2==100)] # find all "100" for each specific level of  Var1
  sel.begin = sel.100+1 # find initial value 
  sel.end   = sel.100-1 # find last value
  sel.end   = c(sel.end[2:length(sel.end)],sel.var1[length(sel.var1)]) # eliminate first element
  selezione = cbind(sel.begin,sel.end)   # bind initil and final point

  for(j in 1:nrow(selezione){
    if(selezione[i,1]<=selezione[i,2]){
      df$Target[selezione[i,1]:selezione[i,2]] = "si"
    }

      # put all "no"
      df[is.na(df$Target),"Target"] = "no"
       
      df$Target
      for(n in 1: length(df$Var1)){
        df$Target <- ifelse(df$Var2[n]==100 && df$Var2[n+1]==0 && df$Var1[n+1]==df$Var1[n], "si", "no"))
    }
  }
}



