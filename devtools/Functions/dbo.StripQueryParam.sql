SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
create function [dbo].[StripQueryParam](@req varchar(max))
returns varchar(max)
as
begin
	return case when @req like '%?%' then SUBSTRING(@req, 1, CHARINDEX('?', @req, 1) - 1) else @req end
end
GO
