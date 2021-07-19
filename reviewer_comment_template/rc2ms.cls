%This template is based on the work of github-mschroen. I added a few extra things that I prefer. If you prefer to use markdown for your replies check his github page.


\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{rc2ms}[Author response to reviewer comment class]
\LoadClass{article}

\RequirePackage[includeheadfoot,top=20mm, bottom=20mm, footskip=2.5cm]{geometry}

% nice fonts
\usepackage{fontawesome}

%% Generalize fanct header and footer
\usepackage{fancyhdr}

\usepackage{changes} %% for track changes
\colorlet{blue}{black}
%% For quotes
\usepackage{epigraph}
\usepackage{dirtytalk}
\usepackage{todonotes}
\usepackage{tcolorbox}
\tcbuselibrary{theorems}
%You can use the titlesec package to customize chapters, sections and subsections style in an easy way.
\usepackage{titlesec}
% Typography
\RequirePackage[T1]{fontenc}
\RequirePackage{times}
%\RequirePackage{mathptmx} % math also in times font
\RequirePackage{amssymb,amsmath}
\RequirePackage{microtype}
\RequirePackage[utf8]{inputenc}
\usepackage{color}


% Misc
\RequirePackage{graphicx}
\RequirePackage{hyperref} 
\RequirePackage{soul} % Highlight using \hl{}
\newcommand{\stkout}[1]{\ifmmode\text{\sout{\ensuremath{#1}}}\else\sout{#1}\fi}
\setdeletedmarkup{\stkout{#1}}

% Table
\RequirePackage{adjustbox} % center large tables across textwidth by surrounding tabular with \begin{adjustbox}{center}
\renewcommand{\arraystretch}{1.5} % enlarge spacing between rows
\RequirePackage{caption} 
\captionsetup[table]{skip=10pt} % enlarge spacing between caption and table


% To add code with highlighted syntax
\usepackage{minted}


% Section styles

\RequirePackage{titlesec}
\titleformat{\section}{\normalfont\large}{\makebox[0pt][r]{\bf \thesection.\hspace{4mm}}}{0em}{\bfseries}
\titleformat{\subsection}{\normalfont}{\makebox[0pt][r]{\bf \thesubsection.\hspace{4mm}}}{0em}{\bfseries}
\titlespacing{\subsection}{0em}{1em}{-0.3em} % left before after

% Paragraph styles
\setlength{\parskip}{0.6\baselineskip}%
\setlength{\parindent}{0pt}%


% Table styles
\let\oldtabular=\tabular
\let\endoldtabular=\endtabular
\renewenvironment{tabular}[1]{\begin{adjustbox}{center}\begin{oldtabular}{#1}}{\end{oldtabular}\end{adjustbox}}


\newenvironment{quotedtext}{\begin{tcolorbox}[
    arc=0mm,
    colback=white,
    colframe=white!15!black,
    fonttitle=\faCommentingO \; \sffamily,
=]}{\end{tcolorbox}}


% Shortcuts
%% Let textbf be both, bold and italic
%\DeclareTextFontCommand{\textbf}{\bfseries\em}

%% Add RC and AR to the left of a paragraph
%\def\RC{\makebox[0pt][r]{\bf RC:\hspace{4mm}}}
%\def\AR{\makebox[0pt][r]{AR:\hspace{4mm}}}

%% Define that \RC and \AR should start and format the whole paragraph 
\RequirePackage{suffix}
\long\def\RC#1\par{\makebox[0pt][r]{\bf RC:\hspace{4mm}}{{#1}}\par} %\RC
\WithSuffix\long\def\RC*#1\par{\textbf{\textit{#1}}\par} %\RC*
\long\def\AR#1\par{\makebox[0pt][r]{AR:\hspace{10pt}}#1\par} %\AR
\WithSuffix\long\def\AR*#1\par{#1\par} %\AR*

%%%
%DIF PREAMBLE EXTENSION ADDED BY LATEXDIFF
%DIF UNDERLINE PREAMBLE %DIF PREAMBLE
\RequirePackage[normalem]{ulem} %DIF PREAMBLE
\RequirePackage{xcolor}
\providecommand{\DIFadd}[1]{{\protect\color{blue}\uwave{#1}}} %DIF PREAMBLE
\providecommand{\DIFdel}[1]{{\protect\color{red}\sout{#1}}}                      %DIF PREAMBLE
%DIF SAFE PREAMBLE %DIF PREAMBLE
\providecommand{\DIFaddbegin}{} %DIF PREAMBLE
\providecommand{\DIFaddend}{} %DIF PREAMBLE
\providecommand{\DIFdelbegin}{} %DIF PREAMBLE
\providecommand{\DIFdelend}{} %DIF PREAMBLE
%DIF FLOATSAFE PREAMBLE %DIF PREAMBLE
\providecommand{\DIFaddFL}[1]{\DIFadd{#1}} %DIF PREAMBLE
\providecommand{\DIFdelFL}[1]{\DIFdel{#1}} %DIF PREAMBLE
\providecommand{\DIFaddbeginFL}{} %DIF PREAMBLE
\providecommand{\DIFaddendFL}{} %DIF PREAMBLE
\providecommand{\DIFdelbeginFL}{} %DIF PREAMBLE
\providecommand{\DIFdelendFL}{} %DIF PREAMBLE
%DIF END PREAMBLE EXTENSION ADDED BY LATEXDIFF

% Define title defaults if not defined by user
\providecommand{\lettertitle}{Reviewer Comments to the Manuscript}
\let\@journal\@empty
\let\@doi\@empty
\newcommand{\journal}[1]{\gdef\@journal{#1}}
\newcommand{\doi}[1]{\gdef\@doi{#1}}

\definecolor{lightgray}{gray}{0.8}
\definecolor{lightergray}{gray}{0.92}

% Make title and legend
\renewcommand\maketitle{
{\Large\bf \lettertitle}\\[1em]
{\LARGE \@title}\\[1em]
{\@author}\\
{\it \@journal, }\texttt{\@doi}\\
\hrule
\hfill {\bfseries RC:} {\textit{Reviewers' Comment}},\(\quad\square\) Manuscript text
}

\bibliographystyle{apalike}

