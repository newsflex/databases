SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date, ,>
-- Description:	<Description, ,>
-- =============================================
create FUNCTION [dbo].[StripNumber] 
(
	-- Add the parameters for the function here
	@string varchar(max)
)
RETURNS varchar(max)
AS
BEGIN
	declare @result varchar(max)
	set @result=''

	select
	@result=@result+case when ascii(strval) BETWEEN 48 AND 57 then '' else strval end from
	(
		select substring(@string,number,1) as strval from
		(
			select number from master..spt_values where type='p' and number between 1 and len(@string)
		) as t
	) as t1

	-- Return the result of the function
	RETURN @result

END
GO
