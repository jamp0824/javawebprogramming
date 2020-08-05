create or replace procedure sel_board13
(
 vname out boardT.b_name%TYPE,
 vtitle out boardT.b_title%TYPE,
 vcont out boardT.b_cont%TYPE,
 vno in boardT.b_no%TYPE


)
is
begin
 select b_name,b_title,b_cont into vname,vtitle,vcont 
 from boardT where b_no=vno;
end;
/

