% --------------------------------------------------
% 00 Information
% --------------------------------------------------

% [檔案資訊]
% National Taiwan University (NTU) Thesis Template
% Update: 2018.06.26
% Version: 1.0
%

% [作者資訊]
% Author: Hsin-Hsiang Peng
% Github: https://github.com/hsins
% Contact: hsinspeng@gmail.com
%

% --------------------------------------------------
% 01 類別定義 (Class Definition)
% --------------------------------------------------

% [宣告類別]
% - \NeedsTeXFormat             告知編譯器當前的 LaTeX 版本
% - \ProvidesClass          	類別名稱與敘述
%
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{NTUthesis}[2018/07/01 Ver 1.0 NTU Thesis Template]

% [定義選項]
% - \DeclareOption*{}           預設選項，當用戶沒有聲明時執行
% - \DeclareOption{}{}          其中 {選項名稱}{陳述}
%
\DeclareOption{Proposal}{
    \gdef\@TypeZH{博士論文計畫提案書}
    \gdef\@TypeEN{Proposal for Doctoral}
    \gdef\@ClassZH{論文}
    \gdef\@ClassEN{Dissertation}
}

\DeclareOption{Master}{
    \gdef\@TypeZH{碩士}
    \gdef\@TypeEN{Master}
    \gdef\@ClassZH{論文}
    \gdef\@ClassEN{Thesis}
}

\DeclareOption{PhD}{
    \gdef\@TypeZH{博士}
    \gdef\@TypeEN{Doctoral}
    \gdef\@ClassZH{論文}
    \gdef\@ClassEN{Dissertation}
}

\DeclareOption{WangFont}{
    \gdef\@CJKMainFont{全字庫正楷體}
    \gdef\@CJKSansFont{王漢宗細黑體繁}
    \gdef\@CJKMonoFont{全字庫正楷體}
    \gdef\@CJKMainBoldFont{王漢宗顏楷體繁}
    \gdef\@CJKSansBoldFont{王漢宗特黑體繁}
}

\DeclareOption{ARStdFont}{
    \gdef\@CJKMainFont{文鼎標準楷體L}
    \gdef\@CJKSansFont{文鼎黑體L}
    \gdef\@CJKMonoFont{文鼎標準楷體L}
    \gdef\@CJKMainBoldFont{文鼎標準楷體B}
    \gdef\@CJKSansBoldFont{文鼎黑體B}
}

\DeclareOption{BiauKai}{
    \gdef\@CJKMainFont{標楷體}
    \gdef\@CJKSansFont{標楷體}
    \gdef\@CJKMonoFont{標楷體}
    \gdef\@CJKMainBoldFont{標楷體}
    \gdef\@CJKSansBoldFont{標楷體}
}

\DeclareOption*{
    \PassOptionsToClass{\CurrentOption}{report}
}

% Terminates the option processing.
\ProcessOptions\relax
\LoadClass[a4paper, 12pt]{report}

% [中文環境]
%
\renewcommand{\contentsname}{\centerline{目錄}}
\renewcommand{\listfigurename}{\centerline{圖目錄}}
\renewcommand{\listtablename}{\centerline{表目錄}}
\newcommand{\loflabel}{圖}
\newcommand{\lotlabel}{表}

% --------------------------------------------------
% 02 載入套件 (Include Package)
% --------------------------------------------------

% [載入套件]
% - ifthen                      條件判斷支持
% - xparse                      定義命令
% - xeCJK                       排版中日韓(CJK)字符
% - indentfirst                 首行縮進
% - fontspec                    設定中英文字體
% - xcolor                      設定顏色
% - geometry                    設定版面大小
% - titlesec                    設定章節格式
% - titletoc, tocloft           設定目錄格式
% - fancyhdr                    設定頁首頁尾
% - ulem, CJKulem               下劃線、雙下劃線與波浪紋效果
% - setspace                    設定行距（標題內文分別設定）
% - graphicx                    插入圖片
% - tikz                        繪圖
% - eso-pic                     插入圖片於文字下方
% - pdfpages                    插入 pdf 檔案
% - tabularx                    插入表格
% - booktabs                    改善表格設置
% - array                       調整表格高度
% - longtable                   支援跨頁長表格
% - diagbox                     插入表格反斜線
% - multirow                    合併儲存格
% - amsmath, amsthm, amssymb    引入 AMS 數學環境
% - datetime                    日期格式轉換
% - CJKnumb                     中文數字轉換
% - fp, calc                    計算功能
% - hyperref                    超連結
% - paralist                    列表環境
% - footmisc                    自訂腳註符號
% - caption, subcaption         插入圖片、表格標題
% - natbib                      參考文獻
%
\RequirePackage{ifthen}
\RequirePackage{xparse}
\RequirePackage{xeCJK}
\RequirePackage{indentfirst}
\RequirePackage{fontspec}
\RequirePackage{xcolor}
\RequirePackage{geometry}
\RequirePackage{titlesec}
\RequirePackage{titletoc, tocloft}
\RequirePackage{fancyhdr}
\RequirePackage{ulem, CJKulem}
\RequirePackage{setspace}
\RequirePackage{graphicx}
\RequirePackage{tikz}
\RequirePackage{eso-pic}
\RequirePackage{pdfpages}
\RequirePackage{tabularx}
\RequirePackage{booktabs}
\RequirePackage{multirow}
\RequirePackage{diagbox}
\RequirePackage{array}
\RequirePackage{longtable}
\RequirePackage{amsmath, amsthm, amssymb}
\RequirePackage{datetime}
\RequirePackage{CJKnumb}
\RequirePackage{fp, calc}
\RequirePackage{hyperref}
\RequirePackage{paralist}
\RequirePackage{footmisc}
\RequirePackage{caption}
\RequirePackage{subcaption}
\RequirePackage[numbers,super,sort&compress]{natbib}

% --------------------------------------------------
% 03 變數與命令 (Variables & Commands)
% --------------------------------------------------

% [中文縮進]
% - \Eindent                    縮進
% - \Enoindent                  不縮進
%

% 獲取並定義 CJK 字符寬度
\def\elegant@CJKChar@size{\hskip \f@size \p@}
\newdimen\elegant@CJKChar@size@dimen
\settowidth\elegant@CJKChar@size@dimen{\elegant@CJKChar@size\CJKglue}

% 定義命令
\newcommand{\CJKsetfontspace}{
    \settowidth\elegant@CJKChar@size@dimen{\elegant@CJKChar@size\CJKglue}%
    \ifdim\parindent=0pt%
        \relax%
    \else
        \parindent2\elegant@CJKChar@size@dimen%
    \fi
}
\newcommand{\Eindent}{
    \CJKsetfontspace\parindent2\elegant@CJKChar@size@dimen
}
\newcommand{\Enoindent}{
    \parident\z@
}

% [學校系所]
% - \SchoolName{#1}{#2}         學校名稱
%   #1 \@UniversityZH           中文名稱
%   #2 \@UniversityEN           英文名稱
%
% - \CollegeName{#1}{#2}        學院名稱
%   #1 \@CollegeZH              中文名稱
%   #2 \@CollegeEN              英文名稱
%
% - \InstituteName{#1}{#2}      系所名稱
%   #1 \@InstituteZH            中文名稱
%   #2 \@InstituteEN            英文名稱
%
\DeclareRobustCommand{\SchoolName}[2]{
    \gdef\@UniversityZH{#1}
    \gdef\@UniversityEN{#2}
}

\DeclareRobustCommand{\CollegeName}[2]{
    \gdef\@CollegeZH{#1}
    \gdef\@CollegeEN{#2}
}

\DeclareRobustCommand{\InstituteName}[2]{
    \gdef\@InstituteZH{#1}
    \gdef\@InstituteEN{#2}
}

% [論文資訊]
% - \ThesisTitle{#1}{#2}        論文標題
%   #1 \@TitleZH                中文標題
%   #2 \@TitleEN                英文標題
%
% - \Author{#1}{#2}{#3}         作者資訊
%   #1 \@StudentID              學號
%   #2 \@AuthorZH               中文姓名
%   #3 \@AuthorEN               英文姓名
%
% - \Advisor{#1}{#2}            指導教授
%   #1 \@AdvisorZH              中文姓名
%   #2 \@AdvisorEN              英文姓名
%
% - \Keyword{#1}{#2}            關鍵字
% - #1 \@KeywordZN              中文關鍵字
% - #2 \@KeywordEN              英文關鍵字
%
\DeclareRobustCommand{\ThesisTitle}[2]{
    \gdef\@TitleZH{#1}
    \gdef\@TitleEN{#2}
}

\DeclareRobustCommand{\Author}[3]{
    \gdef\@StudentID{#1}
    \gdef\@AuthorZH{#2}
    \gdef\@AuthorEN{#3}
}

\DeclareRobustCommand{\Advisor}[2]{
    \gdef\@AdvisorZH{#1}
    \gdef\@AdvisorEN{#2}
}

\DeclareRobustCommand{\Keyword}[2]{
    \gdef\@KeywordZN{#1}
    \gdef\@KeywordEN{#2}
}

% [日期相關]
% - \OralDate{#1}{#2}{#3}       口試日期
%   #1 \@OralYear               西元年份
%   #2 \@OralMonth              西元月份
%   #3 \@OralDay                西元日期
%   #4 \@OralYearROC            民國年份
%
% - \CoverDate{#1}{#2}{#3}      封面日期
%   #1 \@CoverYear              西元年份
%   #2 \@CoverMonth             西元月份
%   #3 \@CoverDay               西元日期
%   #4 \@CoverYearROC           民國年份
%
\DeclareRobustCommand{\OralDate}[3]{
	\gdef\@OralYear{#1}
	\gdef\@OralMonth{#2}
	\gdef\@OralDay{#3}
	\gdef\@OralYearROC{\the\numexpr#1-1911\relax}
}

\DeclareRobustCommand{\CoverDate}[3]{
	\gdef\@CoverYear{#1}
	\gdef\@CoverMonth{#2}
	\gdef\@CoverDay{#3}
	\gdef\@CoverYearROC{\the\numexpr#1-1911\relax}
}

% [原生標題]
% - \bibname                    參考文獻
%
\renewcommand{\bibname}{參考文獻}

% [浮水印]
% - \WaterMake{#1}{#2}          生成浮水印
%   #1 Opacity                  設置透明度
%   #2 Logo Path                校徽路徑
%
\DeclareRobustCommand{\WaterMark}[2]{
\AddToShipoutPicture{
    \put(0,0){
        \parbox[b][\paperheight]{\paperwidth}{
            \vfill
            \centering
            \begin{tikzpicture}[remember picture, overlay]
                \coordinate (NE) at (current page.north east);
                \coordinate (WM) at ([xshift=-2.5cm, yshift=-2.5cm] NE);
                \node [scale=1, opacity=#1] at (WM) {
                    \includegraphics[width=3.65cm, height=3.65cm]{#2}
                };
            \end{tikzpicture}
            \vfill
}}}}

% [數位識別]
% - \InsertDOI{#1}              生成數位識別碼
%   #1 DOI Code                 數位識別碼
%
\DeclareRobustCommand{\InsertDOI}[1]{
\AddToShipoutPicture{
    \AtPageUpperLeft{
        \fboxrule=0pt\fboxsep=0pt\framebox[\paperwidth][r]{
        \raisebox{-\paperheight}{
        \put(\LenToUnit{-1cm},\LenToUnit{1cm}){
        \fboxrule=0pt\fboxsep=0pt\framebox[0pt][r]{
            \href{http://dx.doi.org/#1}{doi:#1}
}}}}}}}

% [生成封面]
%
\DeclareRobustCommand{\MakeCover}{
\newgeometry{
    top=4cm,
    bottom=3cm,
    left=3cm,               % inner=3cm
    right=3cm               % outer=3cm
}

\begin{titlepage}
    \begin{singlespace}
        \begin{center}
            % ---------------------------------------- %
            %  A 中文校系名稱 (18, 27)
            % ---------------------------------------- %
            \fontsize{18}{27}\selectfont
            {\@UniversityZH}{\@CollegeZH}{\@InstituteZH}\par
            {\@TypeZH}{\@ClassZH}\par

            % ---------------------------------------- %
            %  B 英文系所名稱 (14, 21)
            % ---------------------------------------- %
            \fontsize{14}{21}\selectfont
            {\@InstituteEN}\par
            {\@CollegeEN}\par

            % ---------------------------------------- %
            %  C 英文學校名稱 (16, 24)
            % ---------------------------------------- %
            \fontsize{16}{24}\selectfont
            {\@UniversityEN}\par
            {\@TypeEN} {\@ClassEN}\par

            % ---------------------------------------- %
            %  D 中英文論文題目 (18, 27)
            %    中英文作者姓名 (18, 27)
            %    中英文指導教授 (18, 27)
            %    論文撰寫日期   (18, 27)
            % ---------------------------------------- %
            \vfill
            \fontsize{18}{27}\selectfont
            {\@TitleZH}\par
            {\@TitleEN}\par
            \vfill
            {\@AuthorZH}\par
            {\@AuthorEN}\par
            \vfill
            指導教授: {\@AdvisorZH}~博士\par
            Advisor: {\@AdvisorEN}~Ph.D.\par
            \vfill
            中華民國~{\@CoverYearROC}~年~{\@CoverMonth}~月\par
            \monthname[\@CoverMonth], {\@CoverYear}
        \end{center}
    \end{singlespace}
\end{titlepage}
\clearpage
\restoregeometry
}

% [生成口委審定書]
%
\DeclareRobustCommand{\MakeCertification}{
\pagenumbering{roman}
\addcontentsline{toc}{chapter}{口試委員審定書}
\begin{singlespace}
    \begin{center}
        % ---------------------------------------- %
        %  A 口委審定書標題 (24, 36)
        %                  (26, 39)
        % ---------------------------------------- %
        \fontsize{24}{36}\selectfont
        {\@UniversityZH}{\@TypeZH}學位{\@ClassZH}\par
        \fontsize{26}{39}\selectfont
        口試委員會審定書\par

        % ---------------------------------------- %
        %  B 中英文論文題目 (20, 30)
        % ---------------------------------------- %
        \vfill
        \fontsize{20}{30}\selectfont
        \@TitleZH\par
        \@TitleEN\par
    \end{center}

        % ---------------------------------------- %
        %  C 口委審定書內容 (16, 24)
        % ---------------------------------------- %
        \vfill
        \fontsize{16}{24}\selectfont
        \Eindent
        本論文係{\@AuthorZH}君（{\@StudentID}）在{\@UniversityZH}{\@InstituteZH}完成之{\@TypeZH}學位{\@ClassZH}，於民國~{\@OralYearROC}~年~{\@OralMonth}~月~{\@OralDay}~日承下列考試委員審查通過及口試及格，特此證明\par
\end{singlespace}

\begin{doublespace}
    \begin{center}
        % ---------------------------------------- %
        %  D 口委簽名表格 (16, 24)
        % ---------------------------------------- %
        \vfill
        \fontsize{16}{24}\selectfont
        \begin{tabularx}{\textwidth}{Xl}
            {\hfill}口試委員：{\hfill}& \rule{11.5cm}{1pt}       \\
                & \multicolumn{1}{c}{（指導教授）}               \\
                & \rule{5cm}{1pt}\hspace{1.5cm}\rule{5cm}{1pt}  \\
                & \rule{5cm}{1pt}\hspace{1.5cm}\rule{5cm}{1pt}  \\
                & \rule{5cm}{1pt}\hspace{1.5cm}\rule{5cm}{1pt}  \\
                & \rule{5cm}{1pt}\hspace{1.5cm}\rule{5cm}{1pt}  \\
            所{\hfill}長：{\hfill}& \rule{9cm}{1pt}
        \end{tabularx}
    \end{center}
\end{doublespace}
}

% [誌謝]
%
\newenvironment{Acknowledgement}{
   \chapter*{\centering 誌謝}
   \addcontentsline{toc}{chapter}{誌謝}
   \fontsize{12}{18}\selectfont
}

% [中文摘要]
%
\newenvironment{AbstractZH}{
   \chapter*{\centering 摘要}
   \addcontentsline{toc}{chapter}{摘要}
}

% [英文摘要]
%
\newenvironment{AbstractEN}{
   \chapter*{\centering Abstract}
   \addcontentsline{toc}{chapter}{Abstract}
}

% [目錄生成]
%
\DeclareRobustCommand{\MakeTOC}{
    \addcontentsline{toc}{chapter}{目錄}
    \tableofcontents
    \newpage
    \addcontentsline{toc}{chapter}{圖目錄}
    \listoffigures
    \newpage
    \addcontentsline{toc}{chapter}{表目錄}
    \listoftables
}

% [正文頁碼]
%
\DeclareRobustCommand{\MainBody}{
    \pagenumbering{arabic}
}

% [符號清單]
%
\newenvironment{Denotation}[1][2.5cm]{
    \chapter*{\centering 符號列表}
    \addcontentsline{toc}{chapter}{符號列表}
    \noindent
    \begin{list}{}{
        \renewcommand\makelabel[1]{##1\hfill}
        \setlength{\labelwidth}{#1}                     % 符號欄寬度
        \setlength{\labelsep}{0.5cm}                    % 標籤與列表文字距離
        \setlength{\itemindent}{0cm}                    % 標籤縮進
        \setlength{\leftmargin}{\labelwidth+\labelsep}  % 標籤左邊界
        \setlength{\rightmargin}{0cm}                   % 標籤右邊界
        \setlength{\parsep}{0cm}                        % 段落間距
        \setlength{\itemsep}{18pt}                      % 標籤間距
        \setlength{\listparindent}{0cm}                 % 段落縮進
        \setlength{\topsep}{0pt}                        % 標籤與上文距離
}}{\end{list}}

% [文章內符號清單]
%
\newenvironment{DenotationX}[1][2.5cm]{
    \noindent
    \begin{list}{}{
        \renewcommand\makelabel[1]{##1\hfill}
        \setlength{\labelwidth}{#1}                     % 符號欄寬度
        \setlength{\labelsep}{0.5cm}                    % 標籤與列表文字距離
        \setlength{\itemindent}{0cm}                    % 標籤縮進
        \setlength{\leftmargin}{\labelwidth+\labelsep}  % 標籤左邊界
        \setlength{\rightmargin}{0cm}                   % 標籤右邊界
        \setlength{\parsep}{0cm}                        % 段落間距
        \setlength{\itemsep}{18pt}                      % 標籤間距
        \setlength{\listparindent}{0cm}                 % 段落縮進
        \setlength{\topsep}{0pt}                        % 標籤與上文距離
}}{\end{list}}

% [附錄環境]
%
\newenvironment{Appendix}{
  \chapter*{\centering 附錄}
  \addcontentsline{toc}{chapter}{附錄}
}{}

% --------------------------------------------------
% 04 套件設定 (Package Settings)
% --------------------------------------------------

% [文章排版]
%
\XeTeXlinebreaklocale "zh"
\XeTeXlinebreakskip=0pt plus 1pt
\setlength{\parskip}{10pt}
\setlength{\parindent}{2em}

% [字體設定]
% - \setmainfont{}          	襯線字體
% - \setsansfont{}          	非襯字體
% - \setmonofont{}          	等寬字體
% - \setCJKmainfont{}			中文襯線字體
% - \setCJKsansfont{}			中文非襯字體
% - \setCJKmonofont{}			中文等寬字體
%
\setmainfont{Times New Roman}       % 英文襯線字體
\setsansfont{Droid Sans}            % 英文無襯字體
\setmonofont{Courier New}           % 英文等寬字體

\setCJKmainfont[
    BoldFont=\@CJKMainBoldFont,
    ItalicFont=\@CJKMainBoldFont]{\@CJKMainFont}
\setCJKsansfont[
    BoldFont=\@CJKSansBoldFont]{\@CJKSansFont}
\setCJKmonofont{\@CJKMonoFont}

% [顏色設定]
%

% [版面大小]
%
\geometry{
    top=3cm,
    bottom=2cm,
    left=3cm,               % inner=3cm
    right=3cm               % outer=3cm
}

% [連結設定]
%
\hypersetup{
    colorlinks,
    linkcolor=black,
    anchorcolor=blue,
    citecolor=green
}

% [章節格式]
% \titleformat{command}[shape]{format}{label}{sep}{before}[after]
% - command: 代表欲重新定義之標題階層，包含 \part, \chapter, \section, \paragraph
% - shape: 設定段落形狀，可選參數有 hang, block, display
% - format: 定義標題外觀，如：位置、字體大小粗細…
% - label: 定義標籤前綴標號
% - sep: 定義標號與標題內容間隔距離
% - before: 標題內容前增加文字
% - after: 標題內容後增加文字
%
\titleformat{\chapter}                                  % 設置 Chapter 格式
{\Huge \bfseries}                                       % 定義 format
{Chapter \, \thechapter}                                % 定義 label
{1em}                                                   % 定義 sep
{}                                                      % before

% [目錄格式]
%
\addtocontents{toc}                                     % 修改目錄樣式
{~\hfill\textbf{Page}\par}
{}
{}
{}

\titlecontents{chapter}[0em]                            % 修改目錄樣式
{\vspace{18pt}\normalsize\bfseries\protect}
{\fboxrule=0pt\fboxsep=0pt\framebox[3.5em][l]{第\CJKnumber{\thecontentslabel}章}}
{}
{\hfill\contentspage}

\setlength{\cftbeforesecskip}{8pt}                      % 修改目錄間距
\setlength{\cftbeforesubsecskip}{2.5pt}

\setcounter{tocdepth}{3}                                % 設定目錄深度
\setcounter{secnumdepth}{3}                             % 設定編號深度
\cftsetindents{chapter}{0em}{0em}                       % 設定目錄縮排
\cftsetindents{section}{1.5em}{2.0em}                   % 設定目錄縮排
\cftsetindents{subsection}{3.5em}{2.5em}                % 設定目錄縮排

\renewcommand{\cfttoctitlefont}{\hfill\huge\bfseries}
\renewcommand{\cftchapfont}{\normalsize}
\renewcommand{\cftsecfont}{\normalsize}
\renewcommand{\cftsubsecfont}{\normalsize}

% [頁首頁尾]
%

% [標題格式]
% 載入套件包 titlesec 設定各層標題格式
% \titleformat{command}[shape]{format}{label}{sep}{before}[after]
% - command: 代表欲重新定義之標題階層，包含 \part, \chapter, \section, \paragraph
% - shape: 設定段落形狀，可選參數有 hang, block, display
% - format: 定義標題外觀，如：位置、字體大小粗細…
% - label: 定義標籤前綴標號
% - sep: 定義標號與標題內容間隔距離
% - before: 標題內容前增加文字
% - after: 標題內容後增加文字
%
\titleformat{\chapter}                                  % 設置 Chapter 格式
{\centering\Huge\bfseries}                              % 定義 format
{第\CJKnumber{\thechapter}章}              		        % 定義 label
{1em}                                                   % 定義 sep
{}                                                      % before

% [圖表標題]
%
\setlength{\intextsep}{12bp \@plus4pt \@minus2pt}
\captionsetup{}
\captionsetup[table]{position=top,belowskip={12bp-\intextsep},aboveskip=6bp}
\captionsetup[figure]{position=bottom,belowskip={12bp-\intextsep},aboveskip=6bp}
\captionsetup[sub]{skip=6bp}
