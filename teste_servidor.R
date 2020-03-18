library(RSelenium)
library(stringr)
# tem que rodar via camando o codigo, ex p/ windows: java -jar selenium-server-standalone-x.xx.x.jar
# exemplo de uso funcional
# digitar no prompt para subir o servidor 
# java -Dwebdriver.chrome.verboseLogging=true -Dwebdriver.chrome.driver=C:/Users/cgt/AppData/Local/binman/binman_chromedriver/win32/80.0.3987.106/chromeDriver.exe -jar selenium-server-standalone-4.0.0-alpha-2.jar -port 4444
# após estar rodando o servidor será acessado pela porta: 4444

# --------------------------------------------

rD <- rsDriver(browser = "chrome", version = "latest", port = 4444L, chromever = "latest", verbose = TRUE, check = FALSE)
remDr <- rD$client
remDr$navigate("https://google.com")

webElem <- remDr$findElement(using = 'name', value = 'q')
webElem$getElementAttribute("name")
webElem$sendKeysToElement(list("corona virus", key = "enter"))

#----------- teste da pg do google -------
rD <- rsDriver(browser = "chrome", version = "latest", port = 4444L, chromever = "latest", verbose = TRUE, check = FALSE)
remDr <- rD$client
remDr$navigate("http://www.google.com/ncr")
webElem <- remDr$findElement(using = "xpath", "//*/input[@name = 'q']")
webElem$sendKeysToElement(list("R Cran", key = "enter"))

webElems <- remDr$findElements(using = 'css selector', "div.g div.r h3")
resHeaders <- unlist(lapply(webElems, function(x){x$getElementText()}))

# se for ate a div r, vem com 3 textos, para resolver isso usamos
  #webElems <- remDr$findElements(using = 'css selector', "div.g div.r")
  #stringHeaders <- unlist(lapply(resHeaders, function(x){strsplit(x, "\n" )}))#
  #links <- stringHeaders[seq(1, length(stringHeaders), 3)]
  #elemLink <- webElems[[which(links == "The Comprehensive R Archive Network")]]
  #elemLink$clickElement()

#methods(class=class(webElems))
elemLink <- webElems[[which(resHeaders == "The Comprehensive R Archive Network")]]
elemLink$clickElement()

# --------- para fazer o update da linguagem R ------
#install.packages("installr")
#library(installr)
#updateR()

#------------------- Injecting JavaScript ------------------------------------------------------
# https://ropensci.org/tutorials/rselenium_tutorial/

rD <- rsDriver(browser = "chrome", version = "latest", port = 4444L, chromever = "latest", verbose = TRUE, check = FALSE)
remDr <- rD$client
remDr$navigate("http://www.google.com/ncr")
webElem <- remDr$findElement("css selector", "img#hplogo")
# checa se o elemento não está visivel
remDr$executeScript("return document.getElementById('hplogo').hidden;")

# seta o elemento para não ser exibido
remDr$executeScript("document.getElementById('hplogo').hidden = true;")
# verifica se o elemento está de fato, invisivel
remDr$executeScript("return document.getElementById('hplogo').hidden;")

# ----------------- Injecting JavaScript asynchronously --------------------
# nao deu certo a execucao do assincrono
rD <- rsDriver(browser = "chrome", version = "latest", port = 4444L, chromever = "latest", verbose = TRUE, check = FALSE)
remDr <- rD$client
remDr$executeScript("setTimeout(function(){ alert('Hello');},5000); return 'DONE';")
#remDr$setAsyncScriptTimeout(milliseconds = 10000)

#------------------------- Frames and Windows ------------------------------
rD <- rsDriver(browser = "chrome", version = "latest", port = 4444L, chromever = "latest", verbose = TRUE, check = FALSE)
remDr <- rD$client
remDr$navigate("http://www.r-project.org/")
# selenium tem que estar ativo
XML::htmlParse(remDr$getPageSource())
