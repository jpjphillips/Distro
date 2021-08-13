library(httr)

# Download registration and exit data

url_Registration <- "http://localhost:4010/data/Registration/find"
auth <- HTTraw::auth.camic
APIresponseRegistration <- httr::GET(url_Registration,
                                httr::add_headers(authorization = auth),
                                httr::accept_json())

url_Exit <- "http://localhost:4010/data/Exit/find"
APIresponseExit <- httr::GET(url_Exit,
                                httr::add_headers(authorization = auth),
                                httr::accept_json())

# Extract content from API response (list of lists)
# This object is a
registrationData <- httr::content(APIresponseRegistration)
exitData <- httr::content(APIresponseExit)


#Convert the list into a data frame, remove the first column and name remaining columns
dfRegistration <- data.frame(matrix(unlist(registrationData), nrow=length(registrationData), byrow=TRUE))
dfRegistration <- subset (dfRegistration, select = -X1)
colnames(dfRegistration) = c('date', 'name', 'contactEmail', 'platformEmail', 'phone', 'institution', 'role',
                             'otherInfo', 'certifications', 'certificationsCOuntry', 'anatomicYears', 'anatomicResident', 'screenName')
dfExit <- data.frame(matrix(unlist(exitData), nrow=length(exitData), byrow=TRUE))
dfExit <- subset (dfExit, select = -X1)
colnames(dfExit) = c('date', 'exitEmail', 'update', 'futureEmail', 'eeDAP', 'pathpresenter', 'camicroscope', 
                     'batch1', 'batch2', 'batch3', 'batch4', 'batch5', 'batch6', 'batch7', 'batch8', 'batchNA', 
                     'batchOther', 'otherInfo', 'monitorInfo', 'institution', 'digiFeedback', 'anaFeedback', 
                     'source', 'host', 'educate', 'spread', 'none')
