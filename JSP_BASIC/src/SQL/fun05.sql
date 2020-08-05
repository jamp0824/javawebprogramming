create or replace procedure sel_board15
(

vname out boardT3.b_name%TYPE,
 vtitle out boardT3.b_title%TYPE,
 vcont out boardT3.b_cont%TYPE,
 vno in boardT3.b_no%TYPE 


)
is
begin
 select b_name,b_title,b_cont into vname,vtitle,vcont 
 from boardT3 where b_no=vno;
end;
/

