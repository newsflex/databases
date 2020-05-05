SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE function [dbo].[GetThreadId](@req varchar(max))
returns int
as
begin
	declare @index int, @ln int
	if CHARINDEX('thread', @req) > 0
	begin
		-- loupe format
		set @index = CHARINDEX('thread ', @req) + len('thread ')
		declare @index2 int
		set @index2 = CHARINDEX(' #', @req, @index)
		if @index2 > 0
			set @ln = @index2 - @index
		else
			set @ln = CHARINDEX(',', @req, @index) - @index
	end
	else
	begin
		-- api v1 log format
		set @index = CHARINDEX(' [', @req) + len(' [')
		set @ln = CHARINDEX('] ', @req, @index) - @index
	end

	if @index <= 0
		return -1

	return convert(int,substring(@req, @index, @ln))
end
GO
