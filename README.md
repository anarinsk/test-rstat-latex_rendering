# test-rstat-latex_rendering
Testing tinytex in Rstudio

## What to do 

- 중후 장대한 LexLive 대신 RStudio의 TinyTex을 사용해서 TeX 파일을 컴파일 한다. 

## Install 

### In Rstat file 

```R
install.packages('devtools')
devtools::install_github('yihui/tinytex')
#options(tinytex.verbose = TRUE)
tinytex::install_tinytex()
```

- devtools를 설치한다. 설치되어 있다면 생략 
- `yihui/tinytex`을 설치한다. 
- R의 tinytex을 통해서 시스템 내부에 texlive를 최소 구성으로 설치한다. 


```R

 writeLines(c(
   '\\documentclass{article}',
   '\\begin{document}', 'Hello world!', '\\end{document}'
 ), 'test.tex')
 
tinytex::pdflatex('test.tex')
```

- 현재 디렉토리에 `test.tex`이라는 파일을 쓴다. 
- 이를 컴파일 해본다. 


### Problems 

위의 내용이 잘 되었다면, 일단 tinytex은 잘 설치가 된 것이다. 뭔가 불편하다. 좀 더 편하게 쓰고 싶다! 

- `*.tex` 파일을 RStudio 위에서 컴파일 하고 싶다. 현재의 형태는 `*.R` 파일에서 PDF를 간접 생성하는 것이고 불편하다. 
- 필요한 패키지들을 설치해서 쓰고 싶다. 


### `test.tex`

이제 아래와 같은 `test.tex` 파일을 실행한다고 하자. 

```tex
\documentclass{article}
\usepackage{kotex}
\begin{document}
Hello world! 한글은 어떠함?
\end{document}
```

이 녀석에 대해서 `tinytex::pdflatex('test.tex')`을 날리면 에러를 보게 될 것이다. `kotex` 패키지가 없기 떄문이다. 


#### Installing TeX packages 

몇 가지 방법이 있다. 자세한 것은 이휘의 패키지 해설을 보면 나와 있지만 야매로 간단히 설명하도록 하자. 

```R
tinytex::parse_install(
   text = "! LaTeX Error: File `kotex.sty' not found."
)
```

- 위 text 인자 안에 에러 메시지를 띄워주면 필요한 패키지가 뭔지 찾아서 알아서 설치까지 마친다. 이런 식으로 kotex과 같은 필요한 패키지들을 임의로 설치할 수 있다. 
- 이후 tex 패키지를 업데이트하도록 하자. 

```R
tinytex::tlmgr_update()
```

- 이제 `tinytex::pdflatex('test.tex')`을 실행하면 pdf가 잘 생성될 것이다. 


#### How to render pdf from tex file 

- 디렉토리에 깔린 `test.tex`을 열어보자. 
- 위에 pdf 렌더링 버튼이 보일 것이다. 누르면, 렌더링에 실패한다. 방금 설치했던 `kotex.sty`가 없다고 메시지를 보낼 것이다. 
- 해법은 간단하다. tex file에 대한 기본 렌더러가 tinytex이 아니기 때문이다. 

<kbd>Tools</kbd> -> <kbd>Global Options</kbd> -> <kbd>Sweave</kbd>

"Use tinytex when compling .tex files"을 체크해주자. 




## Ref 

- https://github.com/kimkanu/tinytex-for-korean

- https://yihui.org/tinytex/

- https://github.com/rstudio/rstudio/issues/2788