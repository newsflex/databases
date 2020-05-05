SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE function [dbo].[GetRequestApiKey](@req varchar(max))
returns varchar(max)
as
begin
	declare @index int = CHARINDEX('ApiKey:', @req)

	if @index > 0
		set @index = @index  + len('ApiKey:')
	else
		return 'Parse error'

	return substring(@req, @index, CHARINDEX(';', @req, @index) - @index)
end
GO
