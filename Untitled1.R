install.packages('devtools')
devtools::install_github('yihui/tinytex')
#options(tinytex.verbose = TRUE)
tinytex::install_tinytex()

tinytex::tlmgr('init-usertree')  # again, only do this once
tinytex::tlmgr_install(c('cjk-ko'), usermode = TRUE)
tinytex::tlmgr_update()


 #writeLines(c(
 #  '\\documentclass{article}',
 #  '\\begin{document}', 'Hello world!', '\\end{document}'
 #), 'test.tex')



tinytex::parse_install(
   text = "! LaTeX Error: File `kotex.sty' not found."
)
