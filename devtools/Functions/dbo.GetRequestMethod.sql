SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE function [dbo].[GetRequestMethod](@req varchar(max))
returns varchar(10)
as
begin

	return
		case 
			when  CHARINDEX('GET http', @req) > 0 then 'GET'
			when  CHARINDEX('PUT http', @req) > 0  then 'PUT'
			when  CHARINDEX('PATCH http', @req) > 0  then 'PATCH'
			when  CHARINDEX('POST http', @req) > 0  then 'POST'
			when  CHARINDEX('DELETE http', @req) > 0  then 'DELETE'
			else 'UNKOWN' end

	declare @index int = CHARINDEX('RequestLoggerPlugin: ', @req) 
	
	-- account for csv format from loupes log with qoute in front
	if @index <= 0
		set @index = 2
	else
		set @index = @index + len('RequestLoggerPlugin: ')

	return ltrim(substring(@req, @index, CHARINDEX('http', @req) - @index))
end
GO
