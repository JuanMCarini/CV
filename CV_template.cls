\ProvidesClass{CV_template}[16/09/2022 CV class]
\LoadClass{article}
\NeedsTeXFormat{LaTeX2e}

\RequirePackage[spanish]{babel} % Idioma del CV en español.
\RequirePackage[utf8]{inputenc} % Para caracteres especiales. 
\RequirePackage[a4paper]{geometry} % Definimos estilos de página.
\geometry{top=0.5cm, bottom=0.5cm, left=0.5cm, right=0.5cm} % Eliminamos todos los márgenes posibles.

%----------------------------------------------------------------------------------------------- 
% TEXTO E ICONOS
%-----------------------------------------------------------------------------------------------

\setlength{\parindent}{0mm} % Determinas la sangría en cero.

\RequirePackage{fetamont} % Fuente.
\RequirePackage[T1]{fontenc} % Si no usamos este paquete::
                            % * Las palabras que contienen caracteres acentuados no se pueden separar automáticamente,
                            % * No se puede copiar y pegar correctamente tales palabras de la salida (DVI/PS/PDF),
                            % * Y caracteres como el signo de barra vertical, el signo menor que y el signo mayor dan resultados inesperados en el texto.
\RequirePackage{moresize} % Más tamaños de fuentes.

\RequirePackage{ragged2e} % Alineación del texto.
\RequirePackage{fontawesome} % Set de iconos.
\RequirePackage{paracol} % Para mostrar dos columnas rompibles.

\RequirePackage{fancyhdr} % Nos proporciona amplias funciones, tanto para construir encabezados y pies de página, como para controlar su uso (por ejemplo, en momentos en que LATEX cambiaría automáticamente el estilo de encabezado en uso).
\pagestyle{empty} % Este comando produce cabeceras y pies de paginas vacíos - sin números de página.

%----------------------------------------------------------------------------------------------- 
% COLOR Y TRANSPARENCIAS
%-----------------------------------------------------------------------------------------------

\RequirePackage{transparent} % Cómo se puede usar una pila de colores separada para la transparencia, una propiedad además del color.

\RequirePackage{xcolor} %Ponemos un poco de color, si usamos solo \usepackage{color} tendremos un problema de compatibilidad con el paquete paracol.

\definecolor{maincol}{RGB}{ 225, 0, 0 }
\definecolor{accentcol}{RGB}{ 250, 150, 10 }
\definecolor{darkcol}{RGB}{ 70, 70, 70 }
\definecolor{white}{RGB}{255,255,255} 
\definecolor{darkgray}{HTML}{333333} 
\definecolor{gray}{HTML}{4D4D4D}
\definecolor{sidecolor}{HTML}{E7E7E7}
\definecolor{lightgray}{HTML}{999999}
\definecolor{green}{HTML}{C2E15F}
\definecolor{orange}{HTML}{FDA333}
\definecolor{purple}{HTML}{D3A4F9}
\definecolor{red}{HTML}{FB0B00}
\definecolor{blue}{HTML}{6CE0F1}
\definecolor{mainblue}{HTML}{0E5484}
\definecolor{cerulean}{HTML}{007BA7}
\definecolor{maingray}{HTML}{B9B9B9}
\definecolor{maindarkgray}{HTML}{B3B3B3}

%----------------------------------------------------------------------------------------------- 
%   VARIOS
%----------------------------------------------------------------------------------------------- 

\RequirePackage[hidelinks]{hyperref} % Para usar links.

\RequirePackage{tikz} % Para usar gráficos.
\usetikzlibrary{shapes, backgrounds,mindmap, trees}

\RequirePackage{graphicx} % Para la imagen de la cabecera.
\RequirePackage{float} % Para poner imágenes donde queremos. 

%----------------------------------------------------------------------------------------------- 
%   TABLA/ARRAY
%----------------------------------------------------------------------------------------------- 

\RequirePackage{array} % Para tener un mejor manejo de tablas.
\RequirePackage{multirow}

% Achicamos el interlineado en los los listados de items:
\let\olditemize\itemize\def\itemize{\olditemize\itemsep=-4pt }

%----------------------------------------------------------------------------------------------- 
%   PAQUETES LÓGICOS
%----------------------------------------------------------------------------------------------- 

\usepackage{xstring, xifthen} % Nos proporcionan una prueba \isempty
% \usepackage[absolute,overlay]{textpos}

%----------------------------------------------------------------------------------------------- 
%   SECCIONES DEL CV
%----------------------------------------------------------------------------------------------- 

\newcommand{\cvsection}[1] {
    \vspace{10pt}
	\textbf{\Large{\textcolor{darkcol}{\uppercase{#1}}}}\\[-4pt]
        \textcolor{maincol}{ \rule{0.1\textwidth}{2pt} } 
    \vspace{15pt}
	}

%----------------------------------------------------------------------------------------------- 
%   INFORMACIÓN DE CONTACTO
%----------------------------------------------------------------------------------------------- 

\newcommand{\infocont}[7]{
    \begin{tabular}{cl}
        {\color{maincol}\faCalendar}                             & #1  \\ [6pt]
        \multirow{2}{*}{{\color{maincol}\faInfoCircle}}          & #2  \\ 
                                                                 & #3  \\ [6pt]
        {\color{maincol}\faAt}                                   & #4  \\ [6pt]
        {\color{maincol}\faPhone}                                & #5  \\ [6pt]
        {\color{maincol}\faGithub}                               & #6  \\ [6pt]
        {\color{maincol}\faLinkedinSquare}                       & #7    
    \end{tabular}
    \vspace{10pt}
}
%----------------------------------------------------------------------------------------------- 
%   HABILIDADES
%----------------------------------------------------------------------------------------------- 

\newcommand{\mpwidth}{\linewidth-\fboxsep-\fboxsep}

% Comando para la barra de progreso de habilidades:
% * Param 1: nombre de la habilidad,
% * Param 2: porcentaje (de 0 a 1).
\newcommand{\cvskill}[2] {
    \vspace{0pt}
    \textcolor{black}{\textbf{#1}} 
    \newline	
    \begin{tikzpicture}[scale=1,rounded corners=2pt,very thin]
		\fill [lightgray] (0,0) rectangle (1\mpwidth, 0.15);
		\fill [maincol] (0,0) rectangle (#2\mpwidth, 0.15);
  	\end{tikzpicture} 
    \vspace{10pt}
}

% Comando para habilidades en texto:
\newcommand{\cvtexskill}[2] {
    \vspace{0pt}
    {\large\textbf{#1}:}
    \vspace{2pt}

    \;\textit{#2}
    \vspace{10pt}

}



%----------------------------------------------------------------------------------------------- 
%   EDUCACIÓN
%----------------------------------------------------------------------------------------------- 

\newcommand{\itemedu}[3]{
    \vspace{0pt}
    \begin{tabular*}{13.5cm}{l@{\extracolsep{\fill}}r}
        {\large\textbf{#1}} & {\color{red}\lowercase{\textit{#2}}} \\ 
        % \multicolumn{2}{l}{{\normalfont{#3}}} \\
        {\normalfont{#3}} & \\
    \end{tabular*}\\
    \vspace{2pt}

}

%----------------------------------------------------------------------------------------------- 
%   EXPERIENCIA LABORAL
%----------------------------------------------------------------------------------------------- 

\newcommand{\itememplo}[7]{
    \vspace{0pt}
    \begin{tabular*}{13.5cm}{l@{\extracolsep{\fill}}r}
        {\large\textbf{#1}} & {\color{red}\lowercase{\textit{#2}}} \\ 
        {\normalfont{#3}} & \\
    \end{tabular*}
    \ifthenelse{\isempty{#4}}{}{
        \begin{itemize}
            \item #4
            \ifthenelse{\isempty{#5}}{}{\item #5}
            \ifthenelse{\isempty{#6}}{}{\item #6}
            \ifthenelse{\isempty{#7}}{}{\item #7}
        \end{itemize}
    }
    \vspace{2pt}

}