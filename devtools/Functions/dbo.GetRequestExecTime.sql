SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE function [dbo].[GetRequestExecTime](@req varchar(max))
returns int
as
begin
	declare @index int = CHARINDEX('RequestProfilerPlugin: ', @req)

	-- account for csv format from loupes log with qoute in front
	if @index <= 0
		set @index = 1
	else
		set @index = @index + len('RequestProfilerPlugin: ')

	return convert(int, cast ( substring(@req, @index, CHARINDEX('ms to exec', @req) - @index)as decimal))
end
GO
