\ProvidesClass{CV_template}[2026/08/16 Harvard Style CV class]
\NeedsTeXFormat{LaTeX2e}

% Declaración de opciones de idioma
\DeclareOption{english}{\PassOptionsToPackage{english}{babel}}
\DeclareOption{spanish}{\PassOptionsToPackage{spanish,es-lcroman}{babel}}
\ExecuteOptions{spanish}
\ProcessOptions\relax

\LoadClass[10pt,a4paper]{article}

%----------------------------------------------------------------------------------------------- 
% IDIOMA, CODIFICACIÓN Y MÁRGENES
%-----------------------------------------------------------------------------------------------
\RequirePackage{babel}
\RequirePackage[utf8]{inputenc}
\RequirePackage[T1]{fontenc}
\RequirePackage{lmodern}
\RequirePackage{needspace}
\RequirePackage{etoolbox}

\RequirePackage[a4paper, top=1.1cm, bottom=1.1cm, left=1.5cm, right=1.5cm]{geometry}
\setlength{\parindent}{0mm}
\setlength{\parskip}{0mm}

%----------------------------------------------------------------------------------------------- 
% TIPOGRAFÍA Y ESTILOS DE TEXTO
%-----------------------------------------------------------------------------------------------
\RequirePackage{moresize}
\RequirePackage{ragged2e}
\RequirePackage{enumitem}

% Configuración de viñetas ajustadas
\setlist[itemize]{leftmargin=1.2em, itemsep=1.5pt, topsep=1.5pt, parsep=0pt, partopsep=0pt}

\RequirePackage{fancyhdr}
\pagestyle{empty}

%----------------------------------------------------------------------------------------------- 
% COLORES Y ENLACES
%-----------------------------------------------------------------------------------------------
\RequirePackage{xcolor}
\definecolor{primary}{RGB}{14, 52, 92}       % Azul marino institucional elegante
\definecolor{darktext}{RGB}{30, 30, 30}     % Gris oscuro para lectura óptima
\definecolor{subtext}{RGB}{80, 80, 80}       % Gris secundario
\definecolor{linecolor}{RGB}{180, 180, 180}  % Línea divisoria sobria

\RequirePackage[hidelinks]{hyperref}
\hypersetup{
    colorlinks=true,
    urlcolor=primary,
    linkcolor=primary
}

\RequirePackage{fontawesome}

%----------------------------------------------------------------------------------------------- 
% COMANDOS DE ENCABEZADO
%-----------------------------------------------------------------------------------------------
\newcommand{\cvheader}[3]{%
    \begin{center}%
        {\fontsize{20}{24}\selectfont\textbf{\uppercase{#1}}}\\[3pt]%
        {\large\textbf{\textcolor{primary}{#2}}}\\[4pt]%
        {\small\textcolor{darktext}{#3}}%
    \end{center}%
    \vspace{-4pt}%
}

%----------------------------------------------------------------------------------------------- 
% COMANDOS DE SECCIÓN ESTILO HARVARD
%-----------------------------------------------------------------------------------------------
\newcommand{\cvsection}[1]{%
    \needspace{3\baselineskip}%
    \vspace{5pt}%
    {\large\textbf{\textcolor{primary}{\uppercase{#1}}}}\\[-6pt]%
    {\color{linecolor}\rule{\textwidth}{0.8pt}}%
    \vspace{3pt}%
}

%----------------------------------------------------------------------------------------------- 
% COMANDOS DE EXPERIENCIA LABORAL
%-----------------------------------------------------------------------------------------------
% #1: Puesto, #2: Empresa, #3: Período, #4: Ubicación (opcional)
\newcommand{\cvexperience}[4]{%
    \vspace{3pt}%
    \noindent%
    \begin{minipage}[t]{0.68\textwidth}%
        \textbf{#1}\\%
        \textit{#2}\ifstrempty{#4}{}{ \textcolor{subtext}{-- #4}}%
    \end{minipage}%
    \hfill%
    \begin{minipage}[t]{0.31\textwidth}%
        \raggedleft%
        \textit{\textcolor{darktext}{#3}}%
    \end{minipage}%
    \vspace{2pt}%
}

%----------------------------------------------------------------------------------------------- 
% COMANDOS DE EDUCACIÓN
%-----------------------------------------------------------------------------------------------
% #1: Titulo/Carrera, #2: Institución, #3: Período, #4: Estado/Mención
\newcommand{\cveducation}[4]{%
    \vspace{3pt}%
    \noindent%
    \begin{minipage}[t]{0.68\textwidth}%
        \textbf{#1}\ifstrempty{#4}{}{ \textcolor{primary}{\textbf{-- #4}}}\\%
        \textit{#2}%
    \end{minipage}%
    \hfill%
    \begin{minipage}[t]{0.31\textwidth}%
        \raggedleft%
        \textit{\textcolor{darktext}{#3}}%
    \end{minipage}%
    \vspace{2pt}%
}

%----------------------------------------------------------------------------------------------- 
% COMANDOS DE PROYECTOS
%-----------------------------------------------------------------------------------------------
% #1: Nombre del Proyecto, #2: Tecnologías, #3: Enlace / Rol
\newcommand{\cvproject}[3]{%
    \vspace{3pt}%
    \noindent%
    \begin{minipage}[t]{0.68\textwidth}%
        \textbf{#1}\\%
        \textit{\textcolor{subtext}{\iflanguage{english}{Technologies:}{Tecnologías:} #2}}%
    \end{minipage}%
    \hfill%
    \begin{minipage}[t]{0.31\textwidth}%
        \raggedleft%
        #3%
    \end{minipage}%
    \vspace{2pt}%
}

%----------------------------------------------------------------------------------------------- 
% COMANDOS DE CURSOS
%-----------------------------------------------------------------------------------------------
% #1: Nombre del curso, #2: Institución, #3: Fecha, #4: Link
\newcommand{\cvcourse}[4]{%
    \vspace{2pt}%
    \noindent%
    \begin{minipage}[t]{0.68\textwidth}%
        \textbullet\ \textbf{#1}\ifstrempty{#4}{}{ (#4)}\\%
        \hspace*{1.2em}\textit{\textcolor{subtext}{#2}}%
    \end{minipage}%
    \hfill%
    \begin{minipage}[t]{0.31\textwidth}%
        \raggedleft%
        \textit{\textcolor{darktext}{#3}}%
    \end{minipage}%
    \vspace{1pt}%
}