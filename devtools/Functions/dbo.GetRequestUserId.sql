SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE function [dbo].[GetRequestUserId](@req varchar(max))
returns int
as
begin
	declare @index int = CHARINDEX('Active.PersonId=', @req) 

	if @index > 0
		set @index = @index  + len('Active.PersonId=')
	else
		return -1
		

	return convert(int,substring(@req, @index, CHARINDEX(';', @req, @index) - @index))
end
GO
