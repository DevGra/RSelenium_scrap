library(RSelenium)
# tem que rodar via camando o codigo, ex p/ windows: java -jar selenium-server-standalone-x.xx.x.jar
# exemplo de uso funcional
# digitar no prompt para subir o servidor 
# java -Dwebdriver.chrome.verboseLogging=true -Dwebdriver.chrome.driver=C:/Users/cgt/AppData/Local/binman/binman_chromedriver/win32/80.0.3987.106/chromeDriver.exe -jar selenium-server-standalone-4.0.0-alpha-2.jar -port 4444
# após estar rodando o servidor será acessado pela porta: 4444

# --------------------------------------------

rD <- rsDriver(browser = "chrome", version = "latest", port = 4444L, chromever = "latest", verbose = TRUE, check = FALSE)
remDr <- rD$client
remDr$navigate("https://google.com")




