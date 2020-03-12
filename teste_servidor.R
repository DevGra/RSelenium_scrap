require(RSelenium)
# tem que rodar via camando o codigo, ex p/ windows: java -jar selenium-server-standalone-x.xx.x.jar
# após estar rodando o servidor será acessado pela porta: 4444
remDr <- remoteDriver(remoteServerAddr = "localhost", port = 4444L, browserName = "Chrome")
remDr$open()
remDr$getStatus()

remDr$navigate('http://www.google.com/ncr')
remDr$navigate('http://www.bbs.co.uk')
remDr$getCurrentUrl()
# --------------------------------------------

library(wdman)
library(RSelenium)
driver <- rsDriver(browser("Chrome"))
remDr <- driver[["client"]]
remDr$open()

#------------------------------------------------
library(RSelenium)

rD <- rsDriver(browser = "chrome", version = "latest", port = 4444L, chromever = "80.0.3987.106", verbose = TRUE, check = TRUE)
remDr <- rD$client
remDr$navigate("https://google.com")

# digitar no prompt para subir o servidor 
# java -Dwebdriver.chrome.verboseLogging=true -Dwebdriver.chrome.driver=/chromeDriver.exe -jar selenium-server-standalone-3.9.0.jar -port 4444
# cDrv <- chrome(port = 4444L, version = "80.0.3987.106")
#  eCaps <- list(chromeOptions = list(
#    args = c('--no-sandbox','--headless', '--disable-gpu', '--window-size=1280,800')
#  ))
#  remDr <- remoteDriver(browserName = "chrome", port = 4444L,
#                       extraCapabilities = eCaps)
# remDr$open()
