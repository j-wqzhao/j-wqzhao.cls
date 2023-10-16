%% j-wqzhao.cls
%% LaTeX document class for Journal of Wuqiong Zhao
%%
%% Author:  Wuqiong Zhao
%% License: MIT

\NeedsTeXFormat{LaTeX2e}
\RequirePackage{l3keys2e}

\ProvidesExplClass
  {j-wqzhao}
  {2023/10/17}
  {0.1}
  {Journal of Wuqiong Zhao}

\str_const:Nn \c__j_wqzhao_base_class_str { article }

\keys_define:nn { j-wqzhao }
  {
    , unknown .code:n =
      {
        \iow_term:x
          {
            Passing~option~\CurrentOption \c_space_tl to~
            \str_use:N \c__j_wqzhao_base_class_str
          }
        \PassOptionsToClass { \CurrentOption } { \c__j_wqzhao_base_class_str }
      }
  }
\ProcessKeysOptions { j-wqzhao }
\LoadClass [ twocolumn ] { \c__j_wqzhao_base_class_str }

%% Constants
\str_const:Nn \c__j_wqzhao_class_name_str { j-wqzhao }
\str_const:Nn \c__j_wqzhao_long_str { Journal~of~Wuqiong~Zhao }
\str_const:Nn \c__j_wqzhao_short_str { J.~WQZHAO }

%% Page Settings
\RequirePackage { geometry }
\geometry
  {
    , letterpaper
    , left = 2.1cm
    , right = 2.1cm
    , top = 2.5cm
    , bottom = 2.5cm
  }
\setlength{\columnsep}{16pt}
\RequirePackage { cuted }

%% Maths Settings
\RequirePackage { amsmath }
\RequirePackage { mathtools }
\RequirePackage { bm }
\RequirePackage { amssymb }
\RequirePackage { amsthm }

%% Font Settings
\sys_if_engine_pdftex:TF
  {
    \RequirePackage [ tt = false ] { libertine }
    \RequirePackage [ scaled = 0.95 ] { inconsolata }
  }
  {
    % \RequirePackage { fontspec }
    \RequirePackage [
      mathrm=sym,warnings-off={mathtools-colon,mathtools-overbracket}
    ] { unicode-math }
    \RequirePackage { libertinus }
    % \setmonofont [ Scale = 0.95 ] { Inconsolatazi4 }
    \setmonofont [ Scale = 0.95 ] { inconsolata }
  }

% \sys_if_engine_pdftex:T
%   {
%     \RequirePackage [ libertine ] { newtxmath }
%   }

%% Graphics Settings
\RequirePackage [ dvipsnames ] { xcolor }
\RequirePackage { tikz }
\ExplSyntaxOff
\usetikzlibrary
  {
    , calc
    , fadings
    , positioning
    , shapes.geometric
    , svg.path
  }
\newcommand{\tikzrule}[3][]{\tikz{\fill[#1] (0,0) rectangle (#2,#3);}}
\newcommand{\tikzmark}[2][]{\tikz[remember picture,overlay]
  \node[inner sep=0pt,#1](#2){};}
\ExplSyntaxOn
\definecolor{j@wqzhao@ThemeColor}{RGB}{0, 84, 135}

%% Table Settings
\RequirePackage { tabularx }
\RequirePackage { booktabs }

%% Section Title Settings
\RequirePackage { titlesec }
\titleformat
  { \section }
  { \sffamily\bfseries\large\scshape }
  { \color{j@wqzhao@ThemeColor}\LARGE\thesection }
  { .66em }
  { }
\titleformat
  { \subsection }
  { \sffamily\bfseries\large }
  { \color{j@wqzhao@ThemeColor}\thesubsection }
  { .66em }
  { }
\titleformat
  { \subsubsection }
  { \sffamily\bfseries }
  { \color{j@wqzhao@ThemeColor}\thesubsubsection }
  { .66em }
  { }

%% Caption Settings
\RequirePackage [ labelfont = { bf, color = j@wqzhao@ThemeColor } ] { caption }

%% Citation Settings
\RequirePackage [ style = ieee, max names = 6 ] { biblatex }
\AtNextBibliography{\small}

%% Initial
\RequirePackage { lettrine }
\RequirePackage { GoudyIn }
\renewcommand{\LettrineFontHook}{\color{j@wqzhao@ThemeColor}\GoudyInfamily{}}
\setcounter{DefaultLines}{3}
\newcommand\parstart\lettrine

\RequirePackage { hyperref }
\hypersetup
  {
    , colorlinks = true
    , linkcolor = Blue
    , citecolor = Blue
    , urlcolor = blue
    , pdfsubject = { Journal~of~Wuqiong~Zhao }
    , pdfkeywords = { Journal~of~Wuqiong~Zhao }
    , pdfcreator = { LaTeX~with~j-wqzhao~Class }
  }

%% Title Setup
\tl_new:N \g__j_wqzhao_affiliation_tl
\NewDocumentCommand \affiliation { m }
  {
    \tl_gset:Nn \g__j_wqzhao_affiliation_tl { #1 }
  }
\tl_new:N \g__j_wqzhao_abstract_tl
\RenewDocumentCommand \abstract { m }
  {
    \tl_gset:Nn \g__j_wqzhao_abstract_tl { #1 }
  }
\tl_new:N \g__j_wqzhao_keywords_tl
\NewDocumentCommand \keywords { m }
  {
    \tl_gset:Nn \g__j_wqzhao_keywords_tl { #1 }
  }
\tl_new:N \g__j_wqzhao_issue_info_vol_tl
\tl_new:N \g__j_wqzhao_issue_info_no_tl
\tl_new:N \g__j_wqzhao_issue_info_year_tl
\tl_new:N \g__j_wqzhao_issue_info_category_tl
\NewDocumentCommand \issueinfo { m m m O{Research~Paper} }
  {
    \tl_gset:Nn \g__j_wqzhao_issue_info_vol_tl { #1 }
    \tl_gset:Nn \g__j_wqzhao_issue_info_no_tl { #2 }
    \tl_gset:Nn \g__j_wqzhao_issue_info_year_tl { #3 }
    \tl_gset:Nn \g__j_wqzhao_issue_info_category_tl { #4 }
    \newcommand\j@wqzhao@issue@info@vol{#1}
    \newcommand\j@wqzhao@issue@info@no{#2}
    \newcommand\j@wqzhao@issue@info@year{#3}
    \newcommand\j@wqzhao@issue@info@category{#4}
  }

\ExplSyntaxOff
\newcommand{\j@wqzhao@TitleLine}{%
  \tikz [ outer sep = 0, thin ] {%
    \node (j-wqzhao) at (0, 0) [
      , trapezium
      , trapezium left angle = 90
      , minimum height = 16pt
      , font = \scshape\color{white}
      , fill = j@wqzhao@ThemeColor
      , anchor = south east
    ] {Journal of Wuqiong Zhao};
    \node [right = 5pt of j-wqzhao, gray] {\j@wqzhao@issue@info@category{}};
    \fill [j@wqzhao@ThemeColor, path fading=east] (66pt, 0) rectangle (0.845\textwidth, 1pt);
    \node [minimum height = 60pt] {};% used to push the title line higher
    \node [right = .72\linewidth of j-wqzhao.east, anchor = east, inner xsep = 0] {%
      Vol.~\j@wqzhao@issue@info@vol{}
      \textcolor{lightgray}{$\bm{{\cdot}}$}
      No.~\j@wqzhao@issue@info@no{}
      \textcolor{lightgray}{$\bm{{|}}$}
      \j@wqzhao@issue@info@year{}
    };
  }%
}%
\definecolor{orcidlogocol}{HTML}{A6CE39}
\tikzset{
  orcidlogo/.pic={
    \fill[orcidlogocol] svg{M256,128c0,70.7-57.3,128-128,128C57.3,256,0,198.7,0,128C0,57.3,57.3,0,128,0C198.7,0,256,57.3,256,128z};
    \fill[white] svg{M86.3,186.2H70.9V79.1h15.4v48.4V186.2z}
                 svg{M108.9,79.1h41.6c39.6,0,57,28.3,57,53.6c0,27.5-21.5,53.6-56.8,53.6h-41.8V79.1z M124.3,172.4h24.5c34.9,0,42.9-26.5,42.9-39.7c0-21.5-13.7-39.7-43.7-39.7h-23.7V172.4z}
                 svg{M88.7,56.8c0,5.5-4.5,10.1-10.1,10.1c-5.6,0-10.1-4.6-10.1-10.1c0-5.6,4.5-10.1,10.1-10.1C84.2,46.7,88.7,51.3,88.7,56.8z};
  }
}
\newcommand{\@OrigHeightRecip}{0.0045}
\newlength{\@curXheight}
\DeclareRobustCommand\orcidlink[1]{%
  \texorpdfstring{%
    \setlength{\@curXheight}{\fontcharht\font`X}%
    \href{https://orcid.org/#1}{\XeTeXLinkBox{\mbox{%
    \begin{tikzpicture}[yscale=-\@OrigHeightRecip*\@curXheight,
    xscale=\@OrigHeightRecip*\@curXheight,transform shape]
    \pic{orcidlogo};
    \end{tikzpicture}%
  }}}}{}%
}
\ExplSyntaxOn
\DeclareDocumentCommand \maketitle { }
  {
    \thispagestyle{plain}
    \begin{strip}
      \smash
      {
        \noindent \j@wqzhao@TitleLine
      }
      \par

      \noindent \textbf { \huge \sffamily \color{j@wqzhao@ThemeColor} \@title{} }
      \par
      \vspace*{\baselineskip}
      \noindent \textbf { \large \sffamily \@author{} }

      \tl_if_empty:NF { \g__j_wqzhao_affiliation_tl }
        {
          \par\vspace{3pt}
          \noindent
          \textit { \sffamily \color{gray} \g__j_wqzhao_affiliation_tl }
        }

      \tl_if_empty:NF { \g__j_wqzhao_abstract_tl }
        {
          \par\vspace{2\baselineskip}
          \noindent

          \tl_if_empty:NTF { \g__j_wqzhao_keywords_tl }
            {
              \begin{tabularx}{\linewidth}{!{\color{j@wqzhao@ThemeColor}\vrule width 3pt} X@{}}
                \sffamily \textcolor{j@wqzhao@ThemeColor}{\bfseries\textsc{Abstract}:}~
                \tl_use:N \g__j_wqzhao_abstract_tl \\[-6pt]
                \tikzmark[xshift=-\tabcolsep]{abstract-a}\hfill
                \tikzmark{abstract-b}
              \end{tabularx}
            }
            {
              \begin{tabularx}{\linewidth}{!{\color{j@wqzhao@ThemeColor}\vrule width 3pt} X@{}}
                \sffamily \textcolor{j@wqzhao@ThemeColor}{\bfseries\textsc{Abstract}:}~
                \tl_use:N \g__j_wqzhao_abstract_tl \\[-6pt]
                \tikzmark[xshift=-\tabcolsep]{abstract-a}\hfill
                \tikzmark{abstract-b} \\[6pt]
                \sffamily \textcolor{j@wqzhao@ThemeColor}{\bfseries\textsc{Keywords}:}~
                \tl_use:N \g__j_wqzhao_keywords_tl
              \end{tabularx}
            }
            \begin{tikzpicture}[remember~picture, overlay]
              \fill[j@wqzhao@ThemeColor, path~fading = east] ([yshift = -2.55pt]abstract-a) rectangle ([yshift = -3.55pt]abstract-b);
            \end{tikzpicture}
        }

    \end{strip}

    \hypersetup
      {
        , pdftitle = { \@title }
        , pdfauthor = { \@author }
      }
  }

%% Headers and Footers
\RequirePackage { fancyhdr }
\pagestyle { fancy }
\fancyhf{}
\renewcommand{\headrulewidth}{0pt}
\fancyhead[l]{ \scshape \color{j@wqzhao@ThemeColor} \c__j_wqzhao_long_str }
\fancyhead[r]
  {
    Vol.~
    \tl_use:N \g__j_wqzhao_issue_info_vol_tl
    \c_space_tl \textcolor{lightgray}{$\bm{{\cdot}}$}~
    No.~
    \tl_use:N \g__j_wqzhao_issue_info_no_tl
    \c_space_tl \textcolor{lightgray}{$\bm{{|}}$}~
    \tl_use:N \g__j_wqzhao_issue_info_year_tl
  }

\endinput
