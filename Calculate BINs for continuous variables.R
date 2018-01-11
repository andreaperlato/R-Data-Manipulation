#==============================
# Calculate BINs using mltools
#==============================
df <- data.frame(var1=1:15, var2=c(181,179,180.5,201,201.5,245,246.4,
                                 189.3,301,354,369,205,199,394,231.3))
# Here, we want to calcutate BINs for the continuous variable var2

# Solution A:
# resulting bins have an equal number of observations in each group
df[, "var3"] <- bin_data(df$var2, bins=20, binType = "quantile")

# Solution B:
# resulting bins are equally spaced from min to max
df[, "var4"] <- bin_data(df$var2, bins=20, binType = "explicit")

# Solution C:
# define custom bins
df[, "var5"] <- bin_data(df$var2, bins=c(-Inf, 250, 322, Inf), binType = "explicit")

# Solution D:
# without using package mltools:
findInterval(df$var2, unique(quantile(df$var2, seq(0, 1, length.out = 3 + 1))), rightmost.closed = TRUE)
