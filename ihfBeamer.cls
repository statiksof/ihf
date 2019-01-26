%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% ihf Präsentations Klasse
%%     IHF, TUHH
%% Diese Klasse definiert die IHF-Beamer-Kasse für Vorträge.
%%		Beispiele für die Verwendung sind in der Datei presentation.tex zu finden.
%% Author: Christian Rave
%% Version: 2013.01
%% Änderungen:
%% 		22.10.2012: CR 2012.01 -> Daten aus dem TUHH-Beamer-Template übernommen
%%		20.12.2012: CR 2012.02 -> Optionen "article" und "book"
%%      25.07.2013: CR 2013.01 -> Optionen "classic", "conference" und "student"
%%								Dazu die  Befehle "\iType", "\iPlace" und "\iSession"
%%      03.03.2014: CR 2014.01 -> Option hideallsubsections hinzugefügt
%%		27.06.2014: CR 2014.02 -> Umstellung auf utf8
%%								Optionen utf8 (default),latin1,anisnew,applemac
%% 		04.10.2017: DS 2017.01 -> Option "16zu9"
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


\ProvidesClass{ihfBeamer}

%% Optionen der Klasse

%Default:
\newcommand{\h@ndoutsetting}{
\LoadClass[]{beamer} %Beamer-Klasse verwenden
}

\newcommand{\extern@encoding}{utf8} %default encoding

%Zeichencodierung
\DeclareOption{latin1}{
	\renewcommand{\extern@encoding}{latin1}
}
\DeclareOption{utf8}{
	\renewcommand{\extern@encoding}{utf8}
}
\DeclareOption{ansinew}{
	\renewcommand{\extern@encoding}{ansinew}
}
\DeclareOption{applemac}{
	\renewcommand{\extern@encoding}{applemac}
}

% Handout: 2 Folien auf eine Seite
\DeclareOption{handout2}{
	\renewcommand{\h@ndoutsetting}{
	\LoadClass[]{beamer} %Beamer-Klasse verwenden

	\RequirePackage{pgfpages}
	\pgfpagesuselayout{2 on 1}[a4paper,border shrink=15mm]
	}
	\PassOptionsToClass{handout}{beamer}
}
% Handout: Eine Folie pro Seite
\DeclareOption{handout}{
	\renewcommand{\h@ndoutsetting}{
	\LoadClass[]{beamer} %Beamer-Klasse verwenden
	}
	\PassOptionsToClass{handout}{beamer}
}

\DeclareOption{article}{
	\renewcommand{\h@ndoutsetting}{
		\LoadClass[a4paper]{article}
		\RequirePackage{beamerarticle}
	}
}
\DeclareOption{book}{
	\renewcommand{\h@ndoutsetting}{
		\LoadClass[a4paper]{book}
		\RequirePackage{beamerarticle}
	}
}


\DeclareOption{16zu9}{
	\renewcommand{\h@ndoutsetting}{
	\LoadClass[]{beamer} %Beamer-Klasse verwenden
	}
	\PassOptionsToClass{aspectratio=169}{beamer}
}


% Art des Vortrages:
\newcommand{\titleP@geLogo}{./beamerthemeHarburg_tuhh_logo}
\newcommand{\titlep@geLogoCmd}[1]{\includegraphics[width=0.3\paperwidth]{#1}}
\newcommand{\pre@uthorNote}{}
\newcommand{\preD@teNote}{}
\DeclareOption{classic}{
% Normales Logo
}

\DeclareOption{conference}{
	\renewcommand{\preD@teNote}{\small\theType, \thePlace\\ \theSession\,- }
}

\DeclareOption{student}{
	\renewcommand{\titleP@geLogo}{./ihf_logo}
	\renewcommand{\titlep@geLogoCmd}[1]{\includegraphics[width=0.2\paperwidth]{#1}}
	\renewcommand{\pre@uthorNote}{{\small\theType}\\}
}


% Inhaltsangabe
\newcommand{\hilde@llsubsections}{}
\DeclareOption{hideallsubsections}{
	\renewcommand{\hilde@llsubsections}{hideallsubsections}
}

% Sprache
\newcommand{\B@BelLanguage}{ngerman} % Voreinstellung
\DeclareOption{english}{ % Englisch
	\renewcommand{\B@BelLanguage}{english}
}
\DeclareOption{ngerman}{} % Deutsch ist eingestellt
\DeclareOption{german}{} % Es wird nur die neue Rechtschreibung verwendet

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{beamer}}
\ProcessOptions\relax

\PassOptionsToPackage{\B@BelLanguage}{babel}% Sprache an babel übergeben



\PassOptionsToPackage{utf8}{inputenc}

% Klasse Laden, Einstellungen für Handout:
\h@ndoutsetting


%%%%%%%%%%%%
% Packete einbinden
\RequirePackage[]{babel}				    % Umstellen der Sprache
\RequirePackage[]{inputenc}			% Zeichencodierung latin1

\RequirePackage[T1]{fontenc}
\RequirePackage{lmodern}
\RequirePackage{graphicx}
\RequirePackage{amsmath}
\RequirePackage{multirow}
\RequirePackage{listliketab}

%%%%%%%%%%%
% Logo
\titlegraphic{\titlep@geLogoCmd{\titleP@geLogo}}

%%%%%%%%%
% Befehle

% Titel: Festlegen mit \iTitle[Kurz]{Lang}, Einbinden mit \theLongTitle
\newcommand{\theLongTitle}{KEIN TITEL}
\newcommand{\theShortTitle}{}
\newcommand{\iTitle}[2][]{\renewcommand{\theLongTitle}{#2} \renewcommand{\theShortTitle}{#1} }

% Untertitel: Festlegen mit \iSubTitle[Kurz]{Lang}, Einbinden mit \theLongSubTitle
\newcommand{\theLongSubTitle}{}
\newcommand{\theShortSubTitle}{}
\newcommand{\iSubtitle}[2][]{\renewcommand{\theLongSubTitle}{#2} \renewcommand{\theShortSubTitle}{#1}}


%Autor
\newcommand{\theAuthor}{KEIN AUTHOR}
\newcommand{\theShortAuthor}{}
\newcommand{\iAuthor}[2][]{\renewcommand{\theAuthor}{#2} \renewcommand{\theShortAuthor}{#1}}


%Datum des Vortrages
\newcommand{\theDate}{\today}
\newcommand{\iDate}[1]{\renewcommand{\theDate}{#1}}

%Institut(e)
\newcommand{\theInstitute}{Technische Universität Hamburg-Harburg \\ Institut für Hochfrequenztechnik}
\newcommand{\iInstitute}[1]{\renewcommand{\theInstitute}{#1}}


%Art des Vortrages/ Name der Konferenz
\newcommand{\theType}{}
\newcommand{\iType}[1]{\renewcommand{\theType}{#1}}
\newcommand{\iBachelor}{\renewcommand{\theType}{\iflanguage{ngerman}{Bachelorarbeit}{Bachelor thesis} }}
\newcommand{\iMaster}{\renewcommand{\theType}{\iflanguage{ngerman}{Masterarbeit}{Master thesis} }}
\newcommand{\iDipl}{\renewcommand{\theType}{\iflanguage{ngerman}{Diplomarbeit}{Diploma thesis} }}
\newcommand{\iStud}{\renewcommand{\theType}{\iflanguage{ngerman}{Studienarbeit}{Thesis} }}
\newcommand{\iProject}{\renewcommand{\theType}{\iflanguage{ngerman}{Projektarbeit}{Project thesis} }}

%Ort des Vortrages
\newcommand{\thePlace}{}
\newcommand{\iPlace}[1]{\renewcommand{\thePlace}{#1}}

%Session des Vortrages
\newcommand{\theSession}{}
\newcommand{\iSession}[1]{\renewcommand{\theSession}{#1}}



% Titelseite
\newcommand{\titleframe}{
%\inputencoding{\extern@encoding}
\inputencoding{utf8} % default encoding
\mode<presentation>{
\begin{frame}[plain]
    \vskip-0.5cm
	\titlepage
\end{frame}
}
\mode<article>{\maketitle}
\inputencoding{\extern@encoding} %return to user-encoding
}

% Inhaltsverzeichnis
\newcommand{\contentframe}{
\mode<presentation>{
\begin{frame}{\iflanguage{ngerman}{Gliederung}{Outline}}
	\tableofcontents[\hilde@llsubsections]
\end{frame}
}
\mode<article>{
\tableofcontents
}

\renewcommand{\contentframe}{
	\mode<presentation>{
	\begin{frame}{\iflanguage{ngerman}{Gliederung}{Outline}}
		\tableofcontents[currentsection,hideothersubsections,\hilde@llsubsections]
	\end{frame}
	}
}
}

%%%%%%%%%


%%%%%%%%%%%%%
% Beamer Einstellungen

% Keine Naviagtionssysmbole
\setbeamertemplate{navigation symbols}{}

\setbeamercovered{transparent}


\newcommand{\thePDFtitle}{\theLongTitle}
\newcommand{\iPDFtitle}[1]{\renewcommand{\thePDFtitle}{#1}}
\newcommand{\thePDFauthor}{\theAuthor}
\newcommand{\iPDFauthor}[1]{\renewcommand{\thePDFauthor}{#1}}
\newcommand{\thePDFsubject}{}
\newcommand{\iPDFsubject}[1]{\renewcommand{\thePDFsubject}{#1}}
\newcommand{\thePDFkeywords}{TUHH, IHF}
\newcommand{\iPDFkeywords}[1]{\renewcommand{\thePDFkeywords}{#1}}
% start in presentation mode
\mode<presentation>{
% Hyperref
\hypersetup{
	pdfpagemode   = UseNone,  % FullScreen, UseNone,
	pdfstartview  = FitV,     % FitH, FitV
	pdfauthor			= {\thePDFauthor},
	pdftitle 			= {\thePDFtitle},
	pdfsubject			= {\thePDFsubject},
	pdfkeywords			= {\thePDFkeywords},
}
}


% Author etc.
\title[\theShortTitle]{\theLongTitle}
\subtitle[\theShortSubTitle]{\theLongSubTitle}
\author[\theShortAuthor]{\pre@uthorNote\theAuthor}
\institute{\theInstitute}
\date{\preD@teNote\theDate}

%%%%%%%%%%
