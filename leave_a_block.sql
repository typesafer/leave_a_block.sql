DELIMITER $$
DROP FUNCTION IF EXISTS leave_a_block $$
CREATE FUNCTION leave_a_block (the_param VARCHAR(10)) RETURNS varchar(10)
    DETERMINISTIC
    outer_block:BEGIN
    declare l_value VARCHAR(10);
    
	inner_block: BEGIN
    if the_param = 'A' then

       set l_value := 'This was A';
      LEAVE inner_block;
    elseif the_param = 'B' then

       set l_value := 'This was B';
     
    else

       set l_value := 'Not A or B';

    end if;
    END inner_block;
    return l_value;
    END outer_block$$
DELIMITER ;
