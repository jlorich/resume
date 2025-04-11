%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Medium Length Professional CV - RESUME CLASS FILE
%
% This template has been downloaded from:
% http://www.LaTeXTemplates.com
%
% This class file defines the structure and design of the template. 
%
% Original header:
% Copyright (C) 2010 by Trey Hunner
%
% Copying and distribution of this file, with or without modification,
% are permitted in any medium without royalty provided the copyright
% notice and this notice are preserved. This file is offered as-is,
% without any warranty.
%
% Origianlly created by Trey Hunner, modified by www.LaTeXTemplates.com and Joseph Lorich
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\ProvidesClass{resume}[2010/07/10 v0.9 Resume class]
\NeedsTeXFormat{LaTeX2e}

\LoadClass[11pt,letterpaper]{article} % Font size and paper type

\usepackage[parfill]{parskip} % Remove paragraph indentation
\usepackage{array} % Required for boldface (\bf and \bfseries) tabular columns
\usepackage{ifthen} % Required for ifthenelse statements
\usepackage{multicol} % Required for multi column header
\usepackage{fontspec}
\usepackage[11pt]{moresize}
\usepackage[left=.5in,top=0.6in,right=.5in,bottom=0.6in]{geometry} % Document margins 
\setmainfont[
    Color=000000,
    Path = fonts/lato/,
    BoldItalicFont=Lato-BolIta.ttf,
    BoldFont=Lato-Bol.ttf,
    ItalicFont=Lato-LigIta.ttf,
    FontFace = {sb}{n}{Font=Lato-Reg.ttf}
]{Lato-Lig.ttf}

\DeclareRobustCommand\sbseries{\fontseries{sb}\selectfont}
\DeclareTextFontCommand{\textsb}{\sbseries}

\pagestyle{empty} % Suppress page numbers

%----------------------------------------------------------------------------------------
%	HEADINGS COMMANDS: Commands for printing name and address
%----------------------------------------------------------------------------------------

\def \name#1{\def\@name{#1}} % Defines the \name command to set name
\def \@name {} % Sets \@name to empty by default

\def \addressSep {$\diamond$} % Set default address separator to a diamond

% One, two or three address lines can be specified 
\let \@addressone \relax
\let \@addresstwo \relax
\let \@addressthree \relax

% \address command can be used to set the first, second, and third address (last 2 optional)
\def \address #1{
  \@ifundefined{@addressone}{
    \def \@addressone {#1}
  }{
    \@ifundefined{@addresstwo}{
      \def \@addresstwo {#1}
    }{
      \@ifundefined{@addressthree}{
        \def \@addressthree {#1}
      }
    }
  }
}

%----------------------------------------------------------------------------------------
%	PRINT THE HEADING LINES
%----------------------------------------------------------------------------------------

\let\ori@document=\document
\renewcommand{\document}{
  \ori@document  % Begin document
  \begin{multicols}{2}
        \vspace*{-1em}
        \begin{flushleft}
          \fontsize{40}{40} \textbf \@name
        \end{flushleft}
    \columnbreak
        \vspace{0pt}
        \begin{flushright}
          \@ifundefined{@addressone}{}{ % Print the first address if specified
            \@addressone
          }
          \\*
          \@ifundefined{@addresstwo}{}{ % Print the first address if specified
            \@addresstwo
          }
          \@ifundefined{@addressthree}{}{ % Print the first address if specified
            \\*
            \@addressthree
          }
        \end{flushright}
    \end{multicols}
    \vspace{0em}
}

%----------------------------------------------------------------------------------------
%	SECTION FORMATTING
%----------------------------------------------------------------------------------------

% Defines the rSection environment for the large sections within the CV
\newenvironment{rSection}[1]{ % 1 input argument - section name
  \vspace{.25em}
  {\large \bf #1} % Section title
  \medskip
  \hrule % Horizontal line
}{
}

\newenvironment{rSkills}[1]{
  \vspace{.75em}
  \begin{list}{$\cdot$}{\leftmargin=1.25em} % \cdot used for bullets, no indentation
   \itemsep -0.5em \vspace{-0.5em} % Compress items in list together for aesthetics
  }{
  \end{list}
  \vspace{0em}
}


%----------------------------------------------------------------------------------------
%	WORK EXPERIENCE FORMATTING
%----------------------------------------------------------------------------------------

\newenvironment{rCompany}[3]{ % 2 input arguments - company, job title, year(s) employed
  {\textsb{#1}}
  \ifthenelse{\equal{#3}{}}{ % Third argument is blank
    \ifthenelse{\not \equal{#2}{}}{ % Second argument is not blank
      % Print dates on the same line
      \hfill {\textit{\small #2}}{\parfillskip=0pt\par}
    }
  }{
    % Print title and date on the next line
    \\
    {\textit{\small #2}} \hfill {\textit{\small #3}}{\parfillskip=0pt\par}
  }
  \newline
}{
}


\newenvironment{rRole}[3]{
  \vspace{-.25em}
  \ifthenelse{\equal{#2}{}}{
    \hspace{-.25em} {\small \textsb {#1}} \hfill {\textit{\small #3}}{\parfillskip=0pt\par} % Bold company name and date on the right
  }{
    \hspace{-.25em} {\small \textsb {#1}}  |  {\textit{\small #2}} \hfill {\textit{\small #3}}{\parfillskip=0pt\par} % Bold company name and date on the right
  }
  \vspace{.25em}
  \begin{list}{$\cdot$}{\leftmargin=1.25em} % \cdot used for bullets, no indentation
   \itemsep -0.25em \vspace{-0.5em} % Compress items in list together for aesthetics
  }{
  \end{list}
  \vspace{0em}
}
