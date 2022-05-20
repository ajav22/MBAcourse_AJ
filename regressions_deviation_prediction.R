source("/Users/Arvin 1/Documents/R packages.R")
email = read_csv("./examples/spam.csv")
leaveout = sample(1:nrow(email), 1000)

spamtrain = glm(spam ~., data=email[-leaveout,], family = "binomial")
summary(spamtrain)
pspam = predict(spamtrain, newdata = email[leaveout,], type = "response")
pspam
plot(pspam ~ email$spam[leaveout],
     xlab="", ylab=c("predicted probability of spam"), 
     col=c("navy","red"))
summary(spamtrain)

in_sample_r_squared = with(summary(spamtrain), 1 - deviance/null.deviance)

oos_r_squared = mean(pspam)
