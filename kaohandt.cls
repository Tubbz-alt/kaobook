%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% kaobook
% LaTeX Class
% Version 0.9.4 (2020/12/19)
%
% This template originates from:
% https://www.LaTeXTemplates.com
%
% For the latest template development version and to make contributions:
% https://github.com/fmarotta/kaobook
%
% Authors:
% Federico Marotta (federicomarotta@mail.com)
% Based on the doctoral thesis of Ken Arroyo Ohori (https://3d.bk.tudelft.nl/ken/en)
% and on the Tufte-LaTeX class.
% Modified for LaTeX Templates by Vel (vel@latextemplates.com)
%
% License:
% LPPL (see included MANIFEST.md file)
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%----------------------------------------------------------------------------------------
%	CLASS CONFIGURATION
%----------------------------------------------------------------------------------------

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{kaohandt}[2020/12/19 v0.9.4 kaohandt]

\RequirePackage{xkeyval} % Manage class key-value options

\newcommand{\@classname}{kaohandt} % Class name
\newcommand{\@baseclass}{scrartcl} % Base class name

\newcommand{\@secnumdepth}{2} % Set default numbering depth up to subsections
\DeclareOptionX{secnumdepth}{% % Declare secnumdepth as an option
	\renewcommand{\@secnumdepth}{#1}%
}

% Set the default options
\PassOptionsToClass{a4paper}{\@baseclass}
\DeclareOptionX*{\PassOptionsToClass{\CurrentOption}{\@baseclass}} % Pass through any options to the base class
\ProcessOptionsX\relax % Process the options
\LoadClass{\@baseclass} % Load the base class
\input{styles/kao.sty} % Load the code common to all classes

% Left-align title, authors and date
\xpatchcmd{\@maketitle}{\begin{center}}{\begin{flushleft}}{}{}
\xpatchcmd{\@maketitle}{\end{center}}{\end{flushleft}}{}{}
\xpatchcmd{\@maketitle}{\begin{tabular}[t]{c}}{\begin{tabular}[t]{@{}l@{}}}{}{}

% Set the font for the title
\addtokomafont{title}{\normalfont\bfseries}

% Customise the abstract
\RequirePackage[style]{abstract}

\setlength{\absleftindent}{0pt}% No indent
\if@abstrt
  \renewcommand{\abstitlestyle}[1]{%
	\vspace{-0.6cm}%
    \begin{center}%
	  {\normalfont\bfseries\hspace{-3em} \abstractname\vspace{-.5em}\vspace{\z@}}%
    \end{center}%
  }
\else
  \renewcommand{\abstitlestyle}[1]{\vspace{-.5em}\vspace{\z@}}%
\fi

% Adjust the positions of margintoc and marginnotes
\setlength{\mtocshift}{-0.6cm}
\renewcommand{\marginnotevadjust}{-4pt}

% Do not add lists to the TOC
\PassOptionsToClass{toc=nolistof}{\@baseclass}
\unsettoc{toc}{totoc}

% Set KOMA fonts for elements common to all classes
\addtokomafont{section}{\normalfont\bfseries}
\addtokomafont{subsection}{\normalfont\bfseries}
\addtokomafont{subsubsection}{\normalfont\bfseries}
\addtokomafont{paragraph}{\normalfont\bfseries}
\setkomafont{descriptionlabel}{\normalfont\bfseries}

%----------------------------------------------------------------------------------------
%	NUMBERING
%----------------------------------------------------------------------------------------

\setcounter{secnumdepth}{\@secnumdepth} % Set section numbering depth

\counterwithin*{sidenote}{section} % Uncomment to reset the sidenote counter at each section
%\counterwithout{sidenote}{section} % Uncomment to have one sidenote counter for the whole document
