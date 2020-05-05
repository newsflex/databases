SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

create function [dbo].[GetRequestDate](@req varchar(max))
returns datetime
as
begin
	return replace(substring(@req, 1, 24),',','.')
end
GO
