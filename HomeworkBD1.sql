{\rtf1\ansi\ansicpg1251\cocoartf2580
\cocoatextscaling0\cocoaplatform0{\fonttbl\f0\fmodern\fcharset0 Courier;}
{\colortbl;\red255\green255\blue255;\red109\green109\blue109;\red255\green255\blue255;\red191\green100\blue37;
\red153\green168\blue186;\red133\green96\blue154;\red86\green133\blue173;\red253\green187\blue90;}
{\*\expandedcolortbl;;\cssrgb\c50327\c50328\c50265;\cssrgb\c100000\c100000\c100000;\cssrgb\c79921\c46957\c19137;
\cssrgb\c66409\c71889\c77838;\cssrgb\c59713\c46578\c66896;\cssrgb\c40804\c59335\c73556;\cssrgb\c99879\c77611\c42650;}
\paperw11900\paperh16840\margl1440\margr1440\vieww19880\viewh12860\viewkind0
\pard\tx560\tx1120\tx1680\tx2240\tx2800\tx3360\tx3920\tx4480\tx5040\tx5600\tx6160\tx6720\pardirnatural\partightenfactor0

\f0\fs26 \cf2 \cb3 --task 1\
\
\cf4 select   \cf5 e1.\cf6 name\cf4 ,\
    \cf5 e1.\cf6 salary \cf4 as \cf5 employee_salary\cf4 ,\
    \cf5 e2.\cf6 salary \cf4 as \cf5 chief_salary\cf4 ,\
    d\cf5 .\cf6 name\
\cf4 from \cf5 employee \cf4 as \cf5 e1\
\cf4 left join \cf5 employee \cf4 as \cf5 e2 \cf4 on \cf5 e1.\cf6 chief_id \cf5 = e2.\cf6 id\
\cf4 join \cf5 department \cf4 d on d\cf5 .\cf6 id \cf5 = e1.\cf6 department_id\
\cf4 where \cf5 e1.\cf6 salary \cf5 > e2.\cf6 salary\
\cf4 limit \cf7 10\cf4 ;\
\
\
\cf2 --task 2\
\
\cf4 select \cf5 a.*\
\cf4 from   \cf5 employee a\
\cf4 where  \cf5 a.\cf6 salary \cf5 =\
       (\
    \cf4 select \cf8 max\cf5 (\cf6 salary\cf5 )\
    \cf4 from \cf5 employee b\
    \cf4 where  \cf5 b.\cf6 department_id \cf5 = a.\cf6 department_id\
    \cf4 limit \cf7 10\
           \cf5 )\cf4 ;\
\
\cf2 --task 3\
\cf4 select \cf8 * \cf4 from \cf5 department \cf4 d\
	where \cf5 (\cf4 select \cf8 count\cf5 (e1) \cf4 from \cf5 employee e1 \cf4 where \cf5 e1.\cf6 department_id \cf5 = \cf4 d\cf5 .\cf6 id \cf5 ) <= \cf7 3\
\cf4 	limit 10;\
\
\cf2 --task 4\
\
\cf4 select \cf5 e1.*\
\cf4 from   \cf5 employee e1\
\cf4 left join \cf5 employee e2\
\cf4 on \cf5 (e2.\cf6 id \cf5 = e1.\cf6 chief_id \cf4 and \cf5 e2.\cf6 department_id \cf5 = e1.\cf6 department_id\cf5 )\
\cf4 where \cf5 e2.\cf6 id \cf4 is null\
limit \cf7 10\cf4 ;\
\
\cf2 --task 5\
\
\cf4 with \cf5 id_sum \cf4 as \cf5 (\cf4 select \cf5 e.\cf6 department_id\cf4 , \cf8 sum\cf5 (\cf6 salary\cf5 ) \cf4 as \cf5 salary\
\cf4 from \cf5 employee e\
\cf4 group by \cf6 department_id\cf5 )\
\cf4 select distinct \cf5 i1.\cf6 department_id \cf4 from \cf5 id_sum i1\
\cf4 join \cf5 id_sum i \cf4 on \cf5 i1.salary =(\cf4 select \cf8 max\cf5 (salary) \cf4 from \cf5 id_sum)\cf4 ;\
\
}