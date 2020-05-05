SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE function [dbo].[GetRequestRoute](@req varchar(max))
returns varchar(max)
as
begin
	declare @index int = CHARINDEX('/api/v1', @req) + len('/api/v1')
	declare @index2 int = CHARINDEX(' by ip =', @req)
	declare @ln int=0

	if @index2 > 0
		set @ln = @index2 - @index
	else
		set @ln = len(@req) - @index + 1

	return substring(@req, @index, @ln)
end
GO
