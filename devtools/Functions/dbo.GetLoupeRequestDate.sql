SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE function [dbo].[GetLoupeRequestDate](@req varchar(max))
returns datetime
as
begin
	declare @index int = CHARINDEX(',', @req, 2) - 2

	return convert(datetime, substring(@req, 2, @index))
end
GO
