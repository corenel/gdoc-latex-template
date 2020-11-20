% !Mode:: "TeX:UTF-8"
% !TEX root = beamer.tex

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{GBEAMER}[2020/11/20 general purpose beamer class.
Created: 2020.11.20 by Yusu Pan, Last Modified: 2020.11.20 by Yusu Pan]

%---------- Option ----------
\newif\if@showcopyright\@showcopyrightfalse
\newif\if@shownote\@shownotefalse
\newif\if@showslide\@showslidefalse
\DeclareOption{showcopyright}{\@showcopyrighttrue}
\DeclareOption{shownote}{\@shownotetrue}
\DeclareOption{showslide}{\@showslidetrue}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{ctexbeamer}}
\ProcessOptions\relax
\LoadClass[10pt,aspectratio=169,mathserif]{ctexbeamer}

%---------- 加载宏包 ----------
% 演讲备注
\RequirePackage{pgfpages}
\RequirePackage{xeCJK}
\RequirePackage{amsmath,amsfonts,amssymb,bm}
\RequirePackage{color}
\RequirePackage{graphicx,hyperref,url}
\RequirePackage{comment}
\RequirePackage{xcolor}
\RequirePackage{subcaption}
\RequirePackage{booktabs}
\RequirePackage{graphbox}
\RequirePackage{arydshln}
% disable this if 'show notes only'
\if@showslide
  \RequirePackage[super,square]{natbib}
\fi

\AtEndOfClass{
    \hypersetup{
        unicode,
        % hyperfootnotes=false,
        pdfstartview=FitH,
        CJKbookmarks=true,
        bookmarksnumbered=true,
        bookmarksopen=true,
        % colorlinks=true,      % 链接颜色默认关闭，hidelink打开。
        % citecolor=blue,
        % linktoc=all,
        % linkcolor=blue,
        % anchorcolor=blue,
        % urlcolor=blue,
        hidelinks,          % 隐藏超链接的颜色和边框。
        % draft,                % 草稿模式，提高编译速度，需要时注释掉就可以了。
    }
}
\AtBeginDocument{
    \hypersetup{%
        pdftitle={\GBEAMER@title},%
        pdfauthor={\GBEAMER@author},%
        pdfkeywords={},%
        pdfcreator={LaTeX with hyperref package, using LaTeX Template
        for general purpose beamer}
    }
}

%---------- Beamer设置 ----------

%%%
%%% Inherit definitions from existing themes (DO NOT MODIFY THESE)
%%%
% Layout scheme for outer elements: split header and footer
\useoutertheme{split}
% Color scheme for outer elements: use background colors
\usecolortheme{whale}
% Layout scheme for inner elements: rounded elements
\useinnertheme[shadow]{rounded}
% Color scheme for inner elements: use foreground colors
\usecolortheme{orchid}
%%%
%%% Tweak definitions of inner theme to match personal preferences (MODIFY THESE)
%%%
% Font size in headline/footline
\setbeamerfont{section in head/foot}{size=\scriptsize}
% Itemize items: default (triangle), circle, square, ball
\setbeamertemplate{itemize items}[circle]
% Enumerate items: default, circle, square, ball
\setbeamertemplate{enumerate items}[circle]
% Outline: default, sections numbered, subsections numbered, circle, square, ball, ball unnumbered
\setbeamertemplate{sections/subsections in toc}[default]
% General blocks:
\setbeamertemplate{blocks}[rounded]
% Title page:
\setbeamertemplate{title page}[default][colsep=-4bp,rounded=true]
% Part page:
\setbeamertemplate{part page}[default][colsep=-4bp,rounded=true]
% Caption
\setbeamertemplate{caption}[numbered]
% \setbeamerfont{caption}{size=\scriptsize}
\setlength\abovecaptionskip{0pt}
\renewcommand\figurename{图}
\renewcommand\tablename{表}
% Navigation symbols:
% \setbeamertemplate{navigation symbols}{}

%---------- 页面设置 ----------

%%%
%%% Tweak definitions of outer theme to match Radboud (website) style
%%%
% Background
\pgfdeclareimage[width=\paperwidth,height=\paperheight]{bg}{asset/background.pdf}
\setbeamertemplate{background}{\pgfuseimage{bg}}
% Colors
% \usecolortheme[RGB={182,11,45}]{structure} % Red
% \usecolortheme[RGB={81,122,52}]{structure} % SEU
\usecolortheme[RGB={0,19,77}]{structure} % ZJU dark blue
% \usecolortheme[RGB={0,78,164}]{structure} % ZJU light blue
\setbeamercolor{frametitle}{parent=subsection in head/foot}
\setbeamercolor{frametitle right}{parent=section in head/foot}

\pgfdeclarehorizontalshading[frametitle.bg,frametitle right.bg]{beamer@frametitleshade}{\paperheight}{%
  color(0pt)=(frametitle.bg);
  color(\paperwidth)=(frametitle right.bg)}

\AtBeginDocument{
  \pgfdeclareverticalshading{beamer@topshade}{\paperwidth}{%
    color(0pt)=(bg);
    color(4pt)=(black!50!bg)}
}

% Footline: AUTHOR | TITLE | DATE FRAMENUMBER
\defbeamertemplate*{footline}{gbeamertheme}{%
  \leavevmode%
  \hbox{%
  \begin{beamercolorbox}[wd=.25\paperwidth,ht=2.25ex,dp=1ex,center]{author in head/foot}%
    \usebeamerfont{author in head/foot}\insertshortauthor
  \end{beamercolorbox}%
  \begin{beamercolorbox}[wd=.25\paperwidth,ht=2.25ex,dp=1ex,center]{author in head/foot}%
    \usebeamerfont{author in head/foot}\insertshortdate
  \end{beamercolorbox}%
  \begin{beamercolorbox}[wd=.435\paperwidth,ht=2.25ex,dp=1ex,center]{title in head/foot}%
    \usebeamerfont{title in head/foot}\insertshorttitle
  \end{beamercolorbox}%
   \begin{beamercolorbox}[wd=0.065\paperwidth,ht=2.25ex,dp=1ex,right]{title in head/foot}%
    \insertframenumber{} / \inserttotalframenumber\hspace*{2ex}
  \end{beamercolorbox}}%
  \vskip0pt%
}

% Headline
\defbeamertemplate*{headline}{gbeamertheme}{%
  \leavevmode%
  \@tempdimb=6.4375ex%
    %\multiply\@tempdimb by\beamer@sectionmax%
    \pgfdeclareimage[height=.85\@tempdimb]{logo}{asset/QSY-white.pdf}%
    \pgfdeclareimage[height=.9\@tempdimb]{titlelogo}{asset/ZJDX-tight-white.pdf}%
  \logo{\pgfuseimage{logo}}%
  \ifdim\@tempdimb>0pt%
    \advance\@tempdimb by 1.125ex%
    \begin{beamercolorbox}[wd=.740\paperwidth,ht=\@tempdimb]{section in head/foot}%
      \vbox to\@tempdimb{\vfil\insertsectionnavigationhorizontal{.5\textwidth}{\hskip0pt plus1filll}{}\vfil}%
    \end{beamercolorbox}%
    %% \begin{beamercolorbox}[wd=.4\paperwidth,ht=\@tempdimb,center]{subsection in head/foot}%
    %%   \vbox to\@tempdimb{\vfil\textbf{\footnotesize\insertshortinstitute~~}\vfil}%
    %% \end{beamercolorbox}%
    \begin{beamercolorbox}[wd=.195\paperwidth,ht=\@tempdimb,center]{subsection in head/foot}%
      \vbox to\@tempdimb{\vfil\pgfuseimage{titlelogo}\vfil}%
    \end{beamercolorbox}%
    \begin{beamercolorbox}[wd=.065\paperwidth,ht=\@tempdimb,center]{subsection in head/foot}%
      \vbox to\@tempdimb{\vfil\insertlogo\vfil\vfil}%
    \end{beamercolorbox}%
  \fi%
}

\defbeamertemplate*{frametitle}{gbeamertheme}{%
  \nointerlineskip%
  %\vskip-2pt%
  \hbox{\leavevmode
    \advance\beamer@leftmargin by -12bp%
    \advance\beamer@rightmargin by -12bp%
    \beamer@tempdim=\textwidth%
    \advance\beamer@tempdim by \beamer@leftmargin%
    \advance\beamer@tempdim by \beamer@rightmargin%
    \hskip-\Gm@lmargin\hbox{%
      \setbox\beamer@tempbox=\hbox{\begin{minipage}[b]{\paperwidth}%
          \vbox{}\vskip-.75ex%
          \leftskip0.3cm%
          \rightskip0.3cm plus1fil\leavevmode
          \insertframetitle%
          \ifx\insertframesubtitle\@empty%
            \strut\par%
          \else
            \par{\usebeamerfont*{framesubtitle}{\usebeamercolor[fg]{framesubtitle}\insertframesubtitle}\strut\par}%
          \fi%
          \nointerlineskip
          \vbox{}%
          \end{minipage}}%
      \beamer@tempdim=\ht\beamer@tempbox%
      \advance\beamer@tempdim by 2pt%
      \begin{pgfpicture}{0.1mm}{0pt}{1.01\paperwidth}{\beamer@tempdim}
        \usebeamercolor{frametitle right}
        \pgfpathrectangle{\pgfpointorigin}{\pgfpoint{\paperwidth}{\beamer@tempdim}}
        \pgfusepath{clip}
        \pgftext[left,base]{\pgfuseshading{beamer@frametitleshade}}
      \end{pgfpicture}
      \hskip-\paperwidth%
      \box\beamer@tempbox%
    }%
    \hskip-\Gm@rmargin%
  }%
%  \nointerlineskip
%    \vskip-0.2pt
%    \hbox to\textwidth{\hskip-\Gm@lmargin\pgfuseshading{beamer@topshade}\hskip-\Gm@rmargin}
%    \vskip-2pt
}

%---------- 版权信息设置 ----------

\if@showcopyright
  \AtBeginDocument{%
    \addtobeamertemplate{title page}{}{%
      \begin{quote}\footnotesize
        \textbf{（内部文档，未得许可，禁止外传）} \\
          本文档版权归{\insertinstitute}所有。\\
          Copyright~\copyright{}~\the\year~{\insertinstitute}. \\
      \end{quote}
    }
  }
\fi

%---------- 演讲备注设置 ----------

\if@showslide
  \if@shownote
    \setbeameroption{show notes on second screen=right} % Both
  \else
    \setbeameroption{hide notes} % Only slides
  \fi
\else
  \setbeameroption{show only notes} % Only notes
\fi

% To give a presentation with the Skim reader (http://skim-app.sourceforge.net) on OSX so
% that you see the notes on your laptop and the slides on the projector, do the following:
%
% 1. Generate just the presentation (hide notes) and save to slides.pdf
% 2. Generate onlt the notes (show only nodes) and save to notes.pdf
% 3. With Skim open both slides.pdf and notes.pdf
% 4. Click on slides.pdf to bring it to front.
% 5. In Skim, under "View -> Presentation Option -> Synhcronized Noted Document"
%    select notes.pdf.
% 6. Now as you move around in slides.pdf the notes.pdf file will follow you.
% 7. Arrange windows so that notes.pdf is in full screen mode on your laptop
%    and slides.pdf is in presentation mode on the projector.

% Give a slight yellow tint to the notes page
\setbeamertemplate{note page}{\pagecolor{yellow!5}\insertnote}\usepackage{palatino}

% reset to normal colour at the begin of every frame
% workaround for show notes on second screen
\makeatletter
\def\beamer@framenotesbegin{% at beginning of slide
    \usebeamercolor[fg]{normal text}
    \gdef\beamer@noteitems{}%
    \gdef\beamer@notes{}%
}
\makeatother

%---------- 字体设置 ----------

\setsansfont{Helvetica}
%\setsansfont{Times New Roman}
\definecolor{nvidia}{RGB}{102,156,28}
\definecolor{red}{RGB}{184,13,73}
\definecolor{darkred}{RGB}{145,12,7}
\definecolor{orange}{RGB}{242,151,36}
\definecolor{darkteal}{RGB}{43,106,108}
\definecolor{darkgrey}{RGB}{64,64,64}
\definecolor{darkblue}{RGB}{4,37,58}
\definecolor{tan}{RGB}{225,221,191}
\definecolor{green}{RGB}{76,131,122}
\definecolor{darkgreen}{RGB}{42,50,46}
\definecolor{bluegray}{RGB}{33,36,39}
\definecolor{brown}{RGB}{110,54,42}

%---------- Beamer主题设置 ----------

\beamertemplateballitem
\AtBeginSection[]
{
  \begin{frame}<beamer>
    \frametitle{\textbf{目录}}
    \textbf{\tableofcontents[currentsection]}
  \end{frame}
}