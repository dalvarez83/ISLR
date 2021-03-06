#### Applied 6 ####

library(ISLR)
library(boot)

#### 6(a) ####

# Creating a palceholder for the cv errors
cv.error = rep(0, 5)

# Running a for loop to iterate through each polynomial and fitting data
for (i in 1:5) {
  # Fitting data the polynomial i
  glm.fit = glm(wage ~ poly(age, i), data=Wage)
  
  # Saving the CV estimate for the fit
  cv.error[i] = cv.glm(Wage, glm.fit)$delta[1]
}

# Plotting the results of for loop
plot(c(1:5), cv.error)

## Comments:
## Based on the one-SE rule, the cv chooses the 3rd degree polynomial 
## The ANOVA chooses 4th degree polynomial

#### 6(b) ####

cv.error = rep(0, 5)
# Running a for loop to iterate through each step function and fitting data
for (i in 2:5) {
  # Fitting data the polynomial i
  print(i)
  Wage$age.cut = cut(Wage$age, i)
  glm.fit = glm(wage ~ age.cut, data=Wage)
  
  # Saving the CV estimate for the fit
  cv.error[i] = cv.glm(Wage, glm.fit)$delta[2]
}

plot(c(2:5), cv.error[2:5], pch=20, cex=0.5, lwd=2)
