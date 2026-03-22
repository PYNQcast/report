\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{pynqreport}[2026 PYNQ Raycaster Project Report Class]

% =================================================
% BASE CLASS — two-column, compact for 5-page limit
% =================================================
\LoadClass[10pt,a4paper,twocolumn]{article}

% =================================================
% PACKAGES
% =================================================
\RequirePackage[utf8]{inputenc}
\RequirePackage[T1]{fontenc}
\RequirePackage{geometry}
\RequirePackage{graphicx}
\RequirePackage{xcolor}
\RequirePackage{fancyhdr}
\RequirePackage{titlesec}
\RequirePackage{amsmath,amssymb}
\RequirePackage{hyperref}
\RequirePackage{caption}
\RequirePackage{subcaption}
\RequirePackage{enumitem}
\RequirePackage{balance}
\RequirePackage{booktabs}
\RequirePackage{colortbl}
\RequirePackage{array}
\RequirePackage{tcolorbox}
\RequirePackage{listings}
\RequirePackage{tikz}
\RequirePackage{pgfplots}
\RequirePackage{float}
\RequirePackage{tabularx}
\RequirePackage{multirow}

\pgfplotsset{compat=1.18}
\usetikzlibrary{arrows.meta,positioning,shapes.geometric,calc}

% =================================================
% PAGE GEOMETRY — tight for 5-page report
% =================================================
\geometry{
    a4paper,
    top=1.6cm,
    bottom=1.8cm,
    left=1.6cm,
    right=1.6cm,
    headheight=22pt,
    headsep=14pt
}
\setlength{\columnsep}{0.7cm}
\setlength{\parskip}{2.5pt}
\setlength{\parindent}{0pt}

% =================================================
% COLOUR PALETTE  (Imperial Blue #0000CD — original)
% =================================================
\definecolor{ImperialBlue}{HTML}{0000CD}
\definecolor{ImperialLightBlue}{HTML}{E6EEFF}
\definecolor{ImperialGrey}{HTML}{F2F2F2}
\definecolor{ImperialSilver}{HTML}{D9D9D9}
\definecolor{DarkGrey}{HTML}{374151}
\definecolor{MidGrey}{HTML}{9CA3AF}

\hypersetup{
    colorlinks=true,
    linkcolor=ImperialBlue,
    urlcolor=ImperialBlue,
    citecolor=ImperialBlue
}

% =================================================
% TITLE BLOCK
% =================================================
\newcommand{\projectsubtitle}[1]{\gdef\@projectsubtitle{#1}}
\newcommand{\institution}[1]{\gdef\@institution{#1}}
\newif\ifhassubtitle\hassubtitlefalse
\let\oldprojectsubtitle\projectsubtitle
\renewcommand{\projectsubtitle}[1]{\gdef\@projectsubtitle{#1}\hassubtitletrue}
\institution{Imperial College London}

\renewcommand{\maketitle}{%
\twocolumn[%
\vspace*{-0.7cm}%
\begin{center}%
    {\color{ImperialBlue}\rule{\textwidth}{1.2pt}}\par\vspace{0.35cm}%
    {\LARGE\bfseries\color{ImperialBlue} \@title \par}%
    \ifhassubtitle
        \vspace{0.15cm}%
        {\large\color{DarkGrey} \@projectsubtitle \par}%
    \fi
    \vspace{0.25cm}%
    {\small \@author \quad\textcolor{MidGrey} \quad \@institution \quad\textcolor{MidGrey}{|}\quad \@date \par}%
    \vspace{0.3cm}%
    {\color{ImperialBlue}\rule{\textwidth}{0.4pt}}%
\end{center}%
\vspace{0.35cm}%
]%
}

% =================================================
% ABSTRACT
% =================================================
\renewenvironment{abstract}{%
    \begin{tcolorbox}[
        colback=ImperialLightBlue,
        colframe=ImperialBlue,
        boxrule=0.4pt,
        arc=3pt,
        left=6pt,right=6pt,top=4pt,bottom=4pt
    ]%
    \small\noindent\textbf{\color{ImperialBlue}Abstract\enspace---\enspace}\ignorespaces
}{%
    \end{tcolorbox}\vspace{0.2cm}%
}

% =================================================
% SECTION STYLING
% =================================================
\titleformat{\section}
  {\large\bfseries\color{ImperialBlue}}
  {\thesection}{0.6em}{}
\titlespacing{\section}{0pt}{8pt}{4pt}

\titleformat{\subsection}
  {\normalsize\bfseries\color{ImperialBlue}}
  {\thesubsection}{0.6em}{}
\titlespacing{\subsection}{0pt}{6pt}{3pt}

\titleformat{\subsubsection}
  {\small\bfseries}
  {\thesubsubsection}{0.5em}{}
\titlespacing{\subsubsection}{0pt}{4pt}{2pt}

% =================================================
% HEADER / FOOTER
% =================================================
\pagestyle{fancy}
\fancyhf{}
\lhead{\includegraphics[height=0.3cm]{images/Imperial-Logo.png}}
\rhead{\raisebox{-4pt}{\includegraphics[height=0.7cm]{images/PYNQcast_logo.png}}}
\cfoot{\small\color{MidGrey}\thepage}
\renewcommand{\headrulewidth}{0pt}
\renewcommand{\headrule}{{\color{ImperialBlue}\hrule width\headwidth height 0.3pt \vskip-0.3pt}}

% =================================================
% KEY-EQUATION BOX
% =================================================
\newtcolorbox{keyequation}{
    colback=ImperialLightBlue,
    colframe=ImperialBlue,
    boxrule=0.4pt,
    arc=3pt,
    boxsep=4pt,
    left=6pt, right=6pt,
    top=2pt, bottom=2pt,
}

% =================================================
% DESIGN-NOTE BOX (grey with blue left bar)
% =================================================
\newenvironment{designnote}[1][Design note]{%
    \vspace{0.3em}%
    \begin{tcolorbox}[
        colback=ImperialGrey,
        colframe=ImperialBlue,
        leftrule=2.5pt,
        toprule=0pt, bottomrule=0pt, rightrule=0pt,
        arc=0pt,
        boxsep=2pt,
        left=5pt, right=4pt, top=3pt, bottom=3pt
    ]%
    \footnotesize\raggedright\textbf{\color{ImperialBlue}#1:}\enspace\ignorespaces
}{%
    \end{tcolorbox}\vspace{0.2em}%
}

% =================================================
% TABLE STYLING
% =================================================
\newcommand{\AltRow}{\rowcolor{ImperialGrey}}
\setlength{\tabcolsep}{4pt}

\captionsetup{
    labelfont={color=ImperialBlue,bf},
    font=small,
    skip=4pt
}

% =================================================
% CODE LISTINGS
% =================================================
\lstset{
    basicstyle=\ttfamily\scriptsize,
    backgroundcolor=\color{ImperialGrey},
    frame=single,
    rulecolor=\color{ImperialBlue!40},
    keywordstyle=\color{ImperialBlue}\bfseries,
    commentstyle=\color{MidGrey}\itshape,
    stringstyle=\color{ImperialBlue!70!black},
    breaklines=true,
    columns=fullflexible,
    aboveskip=4pt,
    belowskip=4pt,
    xleftmargin=4pt,
    xrightmargin=4pt,
}

% =================================================
% BALANCE COLUMNS AT END
% =================================================
\AtEndDocument{\balance}

\endinput