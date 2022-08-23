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
        \begin{flushleft} 
          \topskip0pt
          \vspace{0pt} \huge \textbf \@name
        \end{flushleft}
    \columnbreak
        \vspace{-0pt}
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
    \vspace{-1.5em}
}

%----------------------------------------------------------------------------------------
%	SECTION FORMATTING
%----------------------------------------------------------------------------------------

% Defines the rSection environment for the large sections within the CV
\newenvironment{rSection}[1]{ % 1 input argument - section name
  \vspace{.25em}
  {\bf #1} % Section title
  \sectionlineskip
  \hrule % Horizontal line
  \begin{list}{}{ % List for each individual item in the section
    \setlength{\leftmargin}{0.0em} % Margin within the section
  }
  \item[]
}{
  \end{list}
}

%----------------------------------------------------------------------------------------
%	WORK EXPERIENCE FORMATTING
%----------------------------------------------------------------------------------------

\newenvironment{rSubsectionTitleOnly}[2]{ % 4 input arguments - company name, year(s) employed, job title and location
 {\textsb{#1}} \hfill {\textit{\small #2}} % Bold company name and date on the right
}

\newenvironment{rSubsectionNoTitle}{ % 4 input arguments - company name, year(s) employed, job title and location
  \smallskip
  \begin{list}{$\cdot$}{\leftmargin=.75em} % \cdot used for bullets, no indentation
   \itemsep -0.5em \vspace{-0.5em} % Compress items in list together for aesthetics
  }{
  \end{list}
  \vspace{0.5em} % Some space after the list of bullet points
}

\newenvironment{rSubsection}[3]{ % 4 input arguments - company name, year(s) employed, job title and location
 {\textsb{#1}} % Bold company name and date on the right
 \ifthenelse{\equal{#2}{}}{}{ % If the third argument is not specified, don't print the job title and location line
  \\
  {\textit{\small #2}} \hfill {\textit{\small #3}}
  }\smallskip
  \begin{list}{$\cdot$}{\leftmargin=.75em} % \cdot used for bullets, no indentation
   \itemsep -0.5em \vspace{-0.5em} % Compress items in list together for aesthetics
  }{
  \end{list}
  \vspace{0em} % Some space after the list of bullet points
}

\newenvironment{rSubSubsection}[2]{ % 4 input arguments - company name, year(s) employed, job title and location
  \hspace{-1em}{ {\textit{\small #1}}} \hfill {\textit{\small #2}} % Bold company name and date on the right
  \smallskip
  \begin{list}{$\cdot$}{\leftmargin=0em} % \cdot used for bullets, no indentation
   \itemsep -0.5em \vspace{-0.5em} % Compress items in list together for aesthetics
  }{
  \end{list}
  \vspace{0em} % Some space after the list of bullet points
}

% The below commands define the whitespace after certain things in the document - they can be \smallskip, \medskip or \bigskip
\def\namesize{\huge} % Size of the name at the top of the document
\def\addressskip{\smallskip} % The space between the two address (or phone/email) lines
\def\sectionlineskip{\medskip} % The space above the horizontal line for each section 
\def\nameskip{\bigskip} % The space after your name at the top
\def\sectionskip{\medskip} % The space after the heading section
